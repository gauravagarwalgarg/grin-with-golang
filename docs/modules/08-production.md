# Module 8: Production

Project layout, error handling at scale, testing patterns, benchmarks, and graceful shutdown.

## Topics

| # | Topic | Source | Key Concepts |
|---|-------|--------|--------------|
| 1 | Project Layout | `src/08_production/01_project_layout/main.go` | cmd/, internal/, pkg/, standard layout |
| 2 | Error Handling (Production) | `src/08_production/02_error_handling_production/main.go` | Structured errors, logging, error chains |
| 3 | Testing Patterns | `src/08_production/03_testing_patterns/main.go` | Table-driven, mocks, testify, golden files |
| 4 | Benchmarking | `src/08_production/04_benchmarking/main.go` | testing.B, benchmem, sub-benchmarks |
| 5 | Graceful Shutdown | `src/08_production/05_graceful_shutdown/main.go` | os.Signal, context cancel, connection drain |
| 6 | Clean Backend | `src/08_production/clean_backend/` | Full service structure, layers, DI |

## Run Any Example

```bash
go run src/08_production/01_project_layout/main.go
```

## Run Tests & Benchmarks

```bash
go test -v src/08_production/03_testing_patterns/...
go test -bench=. src/08_production/04_benchmarking/...
```

## What You'll Learn

- Standard Go project layout that scales
- Production error handling: wrap, log, don't panic
- Table-driven tests as the Go testing idiom
- Benchmarking to measure allocations and throughput
- Graceful shutdown for zero-downtime deployments
