# Module 2: Data Structures

Arrays, slices, maps, structs, interfaces, generics, and JSON Go's built-in data toolkit.

## Topics

| # | Topic | Source | Key Concepts |
|---|-------|--------|--------------|
| 1 | Arrays & Slices | `src/02_data_structures/01_arrays_slices/main.go` | len/cap, append, slice headers, nil vs empty |
| 2 | Maps | `src/02_data_structures/02_maps/main.go` | make, comma-ok, delete, iteration order |
| 3 | Structs | `src/02_data_structures/03_structs/main.go` | Fields, methods, embedding, constructors |
| 4 | Interfaces | `src/02_data_structures/04_interfaces/main.go` | Implicit satisfaction, empty interface, type switch |
| 5 | Generics | `src/02_data_structures/05_generics/main.go` | Type params, constraints, comparable |
| 6 | Custom Types | `src/02_data_structures/06_custom_types/main.go` | Type definitions, method sets, enums via iota |
| 7 | JSON Encoding | `src/02_data_structures/07_json_encoding/main.go` | Marshal/Unmarshal, struct tags, streaming |

## Run Any Example

```bash
go run src/02_data_structures/01_arrays_slices/main.go
```

## What You'll Learn

- Slice internals: pointer + length + capacity
- Maps are unordered never depend on iteration order
- Struct embedding for composition (not inheritance)
- How interfaces enable polymorphism without classes
- Generics (Go 1.18+) for type-safe reusable code
