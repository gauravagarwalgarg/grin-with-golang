# Module 4: Interfaces & Design

Composition over inheritance, dependency injection, SOLID principles idiomatic Go design.

## Topics

| # | Topic | Source | Key Concepts |
|---|-------|--------|--------------|
| 1 | Composition over Inheritance | `src/04_interfaces_design/01_composition_over_inheritance/main.go` | Embedding, delegation, has-a vs is-a |
| 2 | Dependency Injection | `src/04_interfaces_design/02_dependency_injection/main.go` | Constructor injection, interface contracts |
| 3 | SOLID in Go | `src/04_interfaces_design/03_solid_in_go/main.go` | SRP, OCP, LSP, ISP, DIP with Go idioms |
| 4 | Interface Embedding | `src/04_interfaces_design/04_interface_embedding/main.go` | Composing interfaces, io.ReadWriter |
| 5 | Error Types & Patterns | `src/04_interfaces_design/05_error_types_patterns/main.go` | Sentinel errors, custom types, wrapping |

## Run Any Example

```bash
go run src/04_interfaces_design/01_composition_over_inheritance/main.go
```

## What You'll Learn

- Go has no classes composition replaces inheritance
- Small interfaces (1-2 methods) are idiomatic
- Accept interfaces, return structs
- SOLID maps naturally to Go's implicit interface satisfaction
- Error types as domain-specific contracts
