# Module 2.5: Generics Deep Dive

Type parameters, constraints, and generic data structures Go 1.18+ generics in practice.

## Topics

| # | Topic | Source | Key Concepts |
|---|-------|--------|--------------|
| 5 | Generics | `src/02_data_structures/05_generics/main.go` | Type parameters, constraints, Stack[T], Map/Filter, comparable |

## Key Patterns

```go
// Type constraint
type Number interface {
    ~int | ~float64
}

// Generic function
func Sum[T Number](vals []T) T { ... }

// Generic struct
type Stack[T any] struct { items []T }
```

## Run

```bash
go run src/02_data_structures/05_generics/main.go
```

## What You'll Learn

- Type parameters with `[T any]` syntax
- Built-in constraints: `any`, `comparable`
- Custom constraints with interface type sets
- Generic data structures: Stack[T], Set[T]
- When to use generics vs interfaces
