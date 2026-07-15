# GrinWithGolang 🐹

[![CI](https://github.com/gauravagarwalgarg/grin-with-golang/actions/workflows/ci.yml/badge.svg)](https://github.com/gauravagarwalgarg/grin-with-golang/actions/workflows/ci.yml) [![Docs](https://img.shields.io/badge/docs-live-blue?logo=github)](https://gauravagarwalgarg.github.io/grin-with-golang/) ![Go](https://img.shields.io/badge/Go-1.21+-00ADD8?logo=go&logoColor=white) [![License](https://img.shields.io/github/license/gauravagarwalgarg/grin-with-golang)](https://github.com/gauravagarwalgarg/grin-with-golang/blob/main/LICENSE)

> 📖 **Documentation**: [https://gauravagarwalgarg.github.io/grin-with-golang/](https://gauravagarwalgarg.github.io/grin-with-golang/)
>
> 📦 **Repository**: [GitHub](https://github.com/gauravagarwalgarg/grin-with-golang)


> **The Ultimate Go Playbook: From High School Basics to Bare-Metal Scale**

A definitive, production-quality Go masterclass that takes you from zero to Principal Staff Engineer designing global-scale distributed systems.

---

## Who This Is For

| Level | What You'll Get |
|-------|----------------|
| **Beginner** (high-school level) | Visual analogies, step-by-step builds, zero jargon |
| **C++ Developer** switching to Go | Deep mechanical comparisons, memory model, scheduler internals |
| **Mid-level Engineer** | Production patterns, clean architecture, real system design |
| **Senior/Staff** aiming for CTO-track | Global-scale design, observability, interview mastery |

---

## Repository Structure

```
GrinWithGolang/
├── src/
│   ├── 01_foundations/          # Go from zero: types, functions, control flow
│   ├── 02_data_structures/      # Slices, maps, structs, generics
│   ├── 03_concurrency/          # Goroutines, channels, scheduler, lock-free
│   ├── 04_interfaces_design/    # Interfaces, composition, SOLID in Go
│   ├── 05_patterns/             # Functional options, worker pools, circuit breakers
│   ├── 06_networking/           # TCP, HTTP, WebSockets, gRPC
│   ├── 07_systems/              # Memory internals, GC, escape analysis, profiling
│   ├── 08_production/           # Project layout, error handling, testing, CI/CD
│   ├── 09_dsa/                  # DSA in Go: LRU, trie, segment tree, interviews
│   └── 10_distributed/          # Kafka, Redis, Postgres, K8s, observability
│
├── docs/                        # Deep-dive documentation
│   ├── 01-go-vs-cpp.md
│   ├── 02-memory-and-gc.md
│   ├── 03-gmp-scheduler.md
│   ├── 04-channels-internals.md
│   ├── 05-interfaces-under-hood.md
│   ├── 06-generics.md
│   ├── 07-networking-internals.md
│   ├── 08-production-patterns.md
│   ├── 09-interview-roadmap.md
│   └── 10-system-design.md
│
├── go.mod
├── Makefile
└── README.md
```

---

## Learning Path (12 Weeks)

### Phase 1: Foundations (Week 1-3)
```
01_foundations → 02_data_structures → 04_interfaces_design
```
Build muscle memory with Go syntax, understand slices/maps at the byte level, learn composition over inheritance.

### Phase 2: Concurrency & Systems (Week 4-6)
```
03_concurrency → 07_systems → 06_networking
```
Master goroutines and channels, understand the GMP scheduler, build TCP servers, learn profiling.

### Phase 3: Production Engineering (Week 7-9)
```
05_patterns → 08_production → 09_dsa
```
Design patterns, clean architecture, testing strategies, and interview-grade DSA.

### Phase 4: Distributed Systems (Week 10-12)
```
10_distributed → System Design Practice
```
Build real distributed systems with Kafka, Redis, gRPC, Kubernetes, and observability.

---

## Quick Start

```bash
# Clone and setup (installs tools, generates gRPC code, verifies build)
git clone https://github.com/GauravAgarwalGarg/grin-with-golang.git
cd grin-with-golang
chmod +x scripts/setup.sh
./scripts/setup.sh

# Or manually:
go mod tidy
make build
```

### Prerequisites

| Tool | Required | Install |
|------|----------|---------|
| **Go 1.22+** | ✅ Yes | [go.dev/dl](https://go.dev/dl/) |
| **protoc** | ⚡ For gRPC module | `brew install protobuf` |
| **Docker** | 🔧 Optional | For databases, Kafka, NSQ |

> 📖 See [Setup & Prerequisites](https://gauravagarwalgarg.github.io/grin-with-golang/setup/) for full details.

### Run Examples

```bash
make run                                                  # Run hello world
make run FILE=src/03_concurrency/01_goroutines/main.go    # Run specific file
make build                                                # Verify all modules compile
make test                                                 # Run all tests
```

---

## Code Philosophy

Every source file in this repo:
- **Compiles and runs** no pseudocode, no placeholders
- **Teaches with comments** explains WHY, not just WHAT
- **Is self-contained** each file has `package main` + `func main()`
- **Has dual-tone commentary** beginner analogies + C++ mechanical comparisons
- **Includes complexity annotations** Time/Space for every algorithm

---

## Topic Coverage

| Module | Files | What You Learn |
|--------|-------|----------------|
| Foundations | 8 | Variables, functions, control flow, errors, packages |
| Data Structures | 7 | Slices internals, maps, structs, generics, custom types |
| Concurrency | 8 | Goroutines, channels, mutexes, atomics, scheduler, patterns |
| Interfaces & Design | 5 | Composition, embedding, SOLID, dependency injection |
| Patterns | 6 | Functional options, worker pool, fan-in/out, circuit breaker |
| Networking | 5 | TCP, HTTP, WebSocket, gRPC, epoll internals |
| Systems | 5 | Memory model, escape analysis, GC tuning, profiling, unsafe |
| Production | 5+ | Project layout, errors, testing, benchmarks, CI, **Clean Architecture Backend** |
| DSA | 8 | LRU, trie, concurrent map, ring buffer, interview patterns |
| Distributed | 5 | Kafka, Redis, Postgres, K8s deployment, observability |

**Total: 62+ compilable Go source files + 10 deep-dive docs**

---

## License

MIT
