# Module 5: Production Patterns

Battle-tested concurrency and design patterns for real-world Go services.

## Topics

| # | Topic | Source | Key Concepts |
|---|-------|--------|--------------|
| 1 | Functional Options | `src/05_patterns/01_functional_options/main.go` | Option funcs, builder alternative, defaults |
| 2 | Worker Pool Advanced | `src/05_patterns/02_worker_pool_advanced/main.go` | Dynamic scaling, graceful drain, metrics |
| 3 | Fan-In / Fan-Out | `src/05_patterns/03_fan_in_fan_out/main.go` | Merge channels, distribute work, collect results |
| 4 | Circuit Breaker | `src/05_patterns/04_circuit_breaker/main.go` | States, thresholds, half-open recovery |
| 5 | Retry with Backoff | `src/05_patterns/05_retry_with_backoff/main.go` | Exponential backoff, jitter, max attempts |
| 6 | Pub/Sub | `src/05_patterns/06_pub_sub/main.go` | Topics, subscribers, async dispatch |

## Run Any Example

```bash
go run src/05_patterns/01_functional_options/main.go
```

## What You'll Learn

- Functional options for clean, extensible APIs
- Circuit breaker to prevent cascade failures
- Retry with exponential backoff + jitter for distributed systems
- Fan-in/fan-out for parallel data processing pipelines
- In-process pub/sub for decoupled components
