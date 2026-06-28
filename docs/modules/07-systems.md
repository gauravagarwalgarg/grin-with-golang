# Module 7: Systems Internals

Escape analysis, memory layout, garbage collection, profiling, and unsafe under Go's hood.

## Topics

| # | Topic | Source | Key Concepts |
|---|-------|--------|--------------|
| 1 | Escape Analysis | `src/07_systems/01_escape_analysis/main.go` | Stack vs heap, -gcflags="-m", allocation decisions |
| 2 | Memory Layout | `src/07_systems/02_memory_layout/main.go` | Struct padding, alignment, cache lines |
| 3 | Garbage Collector | `src/07_systems/03_garbage_collector/main.go` | Tri-color mark-sweep, STW pauses, GOGC |
| 4 | Profiling | `src/07_systems/04_profiling/main.go` | pprof, CPU/memory profiles, trace tool |
| 5 | Unsafe Pointer | `src/07_systems/05_unsafe_pointer/main.go` | unsafe.Pointer, uintptr, type punning |

## Run Any Example

```bash
go run src/07_systems/01_escape_analysis/main.go
```

## Escape Analysis Check

```bash
go build -gcflags="-m -m" src/07_systems/01_escape_analysis/main.go
```

## What You'll Learn

- How the compiler decides stack vs heap allocation
- Struct field ordering affects memory usage (padding)
- Go's concurrent GC: tri-color, write barriers, pacing
- Profiling with pprof to find bottlenecks
- unsafe package: power and responsibility
