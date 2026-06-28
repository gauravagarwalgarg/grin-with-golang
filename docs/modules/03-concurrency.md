# Module 3: Concurrency

Goroutines, channels, select, synchronization Go's concurrency model from basics to production patterns.

## Topics

| # | Topic | Source | Key Concepts |
|---|-------|--------|--------------|
| 1 | Goroutines | `src/03_concurrency/01_goroutines/main.go` | go keyword, lightweight threads, WaitGroup |
| 2 | Channels Basics | `src/03_concurrency/02_channels_basics/main.go` | Buffered/unbuffered, send/receive, closing |
| 3 | Select Statement | `src/03_concurrency/03_select_statement/main.go` | Multiplexing, timeout, default case |
| 4 | Channel Patterns | `src/03_concurrency/04_channel_patterns/main.go` | Pipeline, fan-out, done channel |
| 5 | Mutexes & Atomics | `src/03_concurrency/05_mutexes_atomics/main.go` | sync.Mutex, RWMutex, atomic operations |
| 6 | Context | `src/03_concurrency/06_context/main.go` | WithCancel, WithTimeout, propagation |
| 7 | Worker Pool | `src/03_concurrency/07_worker_pool/main.go` | Bounded concurrency, job/result channels |
| 8 | Errgroup & Semaphore | `src/03_concurrency/08_errgroup_semaphore/main.go` | errgroup.Group, weighted semaphore |

## Run Any Example

```bash
go run src/03_concurrency/01_goroutines/main.go
```

## What You'll Learn

- Goroutines cost ~2KB stack spawn thousands cheaply
- Channels for communication, mutexes for state protection
- Context for cancellation propagation across goroutine trees
- Worker pool pattern for bounded parallelism
- errgroup for structured concurrency with error collection
