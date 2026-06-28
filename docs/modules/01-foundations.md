# Module 1: Foundations

Go from zero variables, functions, control flow, errors, pointers, packages, strings.

## Topics

| # | Topic | Source | Key Concepts |
|---|-------|--------|--------------|
| 1 | Hello World | `src/01_foundations/01_hello_world/main.go` | package, import, func main |
| 2 | Variables & Types | `src/01_foundations/02_variables_types/main.go` | var, :=, const, zero values |
| 3 | Functions | `src/01_foundations/03_functions/main.go` | Multiple returns, closures, variadic |
| 4 | Control Flow | `src/01_foundations/04_control_flow/main.go` | for (only loop), switch, defer |
| 5 | Errors | `src/01_foundations/05_errors/main.go` | error interface, %w wrapping, Is/As |
| 6 | Pointers | `src/01_foundations/06_pointers/main.go` | & and *, no arithmetic, pass by pointer |
| 7 | Packages | `src/01_foundations/07_packages_modules/main.go` | Visibility, go.mod, project layout |
| 8 | Strings & Runes | `src/01_foundations/08_strings_runes/main.go` | UTF-8, rune iteration, Builder |

## Run Any Example

```bash
go run src/01_foundations/01_hello_world/main.go
```

## What You'll Learn

- Go's type system: static, inferred, no implicit conversions
- Error handling as values (no exceptions)
- Pointers without arithmetic safe by design
- Package visibility via capitalization
- UTF-8 native string handling with runes
