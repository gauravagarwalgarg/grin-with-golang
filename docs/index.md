# Grin With Golang 🐹

> The Ultimate Go Playbook: From High School Basics to Bare-Metal Scale

## Learning Path

| Phase | Weeks | Modules | Focus |
|-------|-------|---------|-------|
| 🌱 Foundations | 1-3 | [Foundations](modules/01-foundations.md), [Data Structures](modules/02-data-structures.md), [Interfaces](modules/04-interfaces-design.md) | Syntax, types, composition |
| ⚡ Concurrency | 4-6 | [Concurrency](modules/03-concurrency.md), [Systems](modules/07-systems.md), [Networking](modules/06-networking.md) | Goroutines, GC, TCP |
| 🏗️ Production | 7-9 | [Patterns](modules/05-patterns.md), [Production](modules/08-production.md), [DSA](modules/09-dsa.md) | Clean code, testing, interviews |
| 🌍 Scale | 10-12 | [Distributed](modules/10-distributed.md) | Kafka, Redis, K8s |

## Quick Start

```bash
# Automated setup (recommended for first time)
git clone https://github.com/GauravAgarwalGarg/grin-with-golang.git
cd grin-with-golang
chmod +x scripts/setup.sh && ./scripts/setup.sh

# Or just run an example
go run src/01_foundations/01_hello_world/main.go
```

👉 **[Full Setup & Prerequisites →](setup.md)**

## Deep Dives

| Topic | What You'll Learn |
|-------|-------------------|
| [Go vs C++](01-go-vs-cpp.md) | Philosophy shift, no inheritance, GC vs RAII |
| [Memory & GC](02-memory-and-gc.md) | Stack/heap, escape analysis, tri-color GC |
| [GMP Scheduler](03-gmp-scheduler.md) | Goroutine scheduling, work stealing, preemption |
| [Channels Internals](04-channels-internals.md) | hchan struct, ring buffer, nil/closed behavior |
| [Interfaces Under Hood](05-interfaces-under-hood.md) | iface/eface, method sets, type assertions |
| [Interview Roadmap](09-interview-roadmap.md) | 4-week plan, company focus areas |

## Code Stats

62+ compilable Go source files across 10 modules. Every file:

- Has `package main` + `func main()` runs independently
- Dual-tone commentary (beginner analogies + C++ comparisons)
- Modules 01–09 use standard library only; Module 10 uses external deps (Kafka, gRPC, MongoDB, etc.)

## Module Map

| # | Module | Topics | Files |
|---|--------|--------|-------|
| 1 | [Foundations](modules/01-foundations.md) | Variables, functions, errors, pointers | 8 |
| 2 | [Data Structures](modules/02-data-structures.md) | Slices, maps, structs, generics | 7 |
| 3 | [Concurrency](modules/03-concurrency.md) | Goroutines, channels, context | 8 |
| 4 | [Interfaces & Design](modules/04-interfaces-design.md) | Composition, DI, SOLID | 5 |
| 5 | [Patterns](modules/05-patterns.md) | Options, circuit breaker, pub/sub | 6 |
| 6 | [Networking](modules/06-networking.md) | TCP, HTTP, WebSocket, gRPC | 5 |
| 7 | [Systems](modules/07-systems.md) | Escape analysis, GC, profiling | 5 |
| 8 | [Production](modules/08-production.md) | Layout, testing, benchmarks | 6 |
| 9 | [DSA](modules/09-dsa.md) | LRU, trie, heap, segment tree | 8 |
| 10 | [Distributed](modules/10-distributed.md) | Service discovery, Kafka, K8s | 10 |
