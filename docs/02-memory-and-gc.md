# Memory Model & Garbage Collection

## Stack vs Heap

```
┌─────────────────────────────────────────┐
│  Stack (per goroutine, starts 2KB)      │
│  ├── Local variables (known size)       │
│  ├── Function parameters                │
│  └── Return addresses                   │
│  Grows/shrinks automatically            │
├─────────────────────────────────────────┤
│  Heap (shared, GC-managed)              │
│  ├── Escaped variables                  │
│  ├── Slice backing arrays (if escaped)  │
│  ├── Map internals                      │
│  └── Interface values (often)           │
└─────────────────────────────────────────┘
```

**Stack allocation is free** (just move stack pointer). Heap requires GC tracking.

## Escape Analysis Rules

The compiler decides stack vs heap. A variable escapes to heap when:

| Rule | Example | Escapes? |
|------|---------|----------|
| Returned pointer | `return &x` | Yes |
| Assigned to interface | `var i interface{} = x` | Yes |
| Captured by closure outliving scope | `go func() { use(x) }()` | Yes |
| Too large for stack | `make([]byte, 1<<20)` | Yes |
| Sent to channel | `ch <- &x` | Yes |
| Known size, local scope | `x := [3]int{1,2,3}` | No |

Check with: `go build -gcflags="-m" ./...`

## GC: Tri-Color Mark & Sweep

```
Phase 1: Mark (concurrent with mutator)
  ┌───┐     ┌───┐     ┌───┐
  │ W │ ──> │ G │ ──> │ B │
  │hit│     │rey│     │lac│
  │ e │     │   │     │ k │
  └───┘     └───┘     └───┘
  unreached  discovered  scanned

  White: potentially garbage (not yet seen)
  Grey:  discovered but children not scanned
  Black: fully scanned (definitely alive)

Phase 2: Sweep
  All remaining white objects → freed
```

**Write barrier**: When a black object gets a reference to a white object,
the white object is greyed (prevents premature collection).

## GC Tuning

| Variable | Default | Effect |
|----------|---------|--------|
| `GOGC` | 100 | GC triggers when heap grows 100% since last GC |
| `GOMEMLIMIT` | unlimited | Soft memory limit (Go 1.19+) |

```
GOGC=200     → less frequent GC, more memory, lower CPU
GOGC=50      → more frequent GC, less memory, higher CPU
GOMEMLIMIT=1GiB → GC becomes aggressive near limit
```

## Reducing Allocation Pressure

1. **Pre-allocate slices**: `make([]T, 0, expectedCap)`
2. **sync.Pool**: Reuse temporary objects across GC cycles
3. **Avoid interface{}**: Causes escape + allocation for value types
4. **strings.Builder**: Instead of `s += "..."` in loops
5. **Stack-sized arrays**: `var buf [64]byte` stays on stack
6. **Pointer receivers**: Avoid copying large structs

Profile with: `go tool pprof -alloc_objects cpu.prof`
