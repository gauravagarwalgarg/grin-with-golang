# Setup & Prerequisites

Get the repo building on your machine in under 5 minutes.

## Prerequisites

| Tool | Required | Purpose | Install |
|------|----------|---------|---------|
| **Go 1.22+** | ✅ Yes | Core language | [go.dev/dl](https://go.dev/dl/) |
| **protoc** | ⚡ For gRPC module | Protobuf compiler | `brew install protobuf` or [grpc.io](https://grpc.io/docs/protoc-installation/) |
| **protoc-gen-go** | ⚡ For gRPC module | Go protobuf plugin | `go install google.golang.org/protobuf/cmd/protoc-gen-go@latest` |
| **protoc-gen-go-grpc** | ⚡ For gRPC module | Go gRPC plugin | `go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest` |
| **Docker** | 🔧 Optional | For databases, Kafka, NSQ | [docker.com](https://www.docker.com/get-started/) |

!!! note "Modules 01–09 need only Go"
    The protobuf tools are only required for the `10_distributed/grpc_service` module. Everything else compiles with just Go installed.

## Quick Setup (Automated)

```bash
git clone https://github.com/GauravAgarwalGarg/grin-with-golang.git
cd grin-with-golang

# Run the setup script installs tools, generates code, verifies build
chmod +x scripts/setup.sh
./scripts/setup.sh
```

The setup script will:

1. ✅ Verify Go is installed
2. ✅ Install `protoc` via Homebrew (if missing and on macOS)
3. ✅ Install `protoc-gen-go` and `protoc-gen-go-grpc`
4. ✅ Generate gRPC protobuf Go code from `user.proto`
5. ✅ Download all Go dependencies (`go mod tidy`)
6. ✅ Verify all 62+ modules compile

## Manual Setup

If you prefer to set things up manually:

```bash
# 1. Clone
git clone https://github.com/GauravAgarwalGarg/grin-with-golang.git
cd grin-with-golang

# 2. Download dependencies
go mod download
go mod tidy

# 3. Install protoc tools (for gRPC module)
brew install protobuf                                    # macOS
# sudo apt install -y protobuf-compiler                  # Ubuntu/Debian
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
export PATH="$PATH:$(go env GOPATH)/bin"

# 4. Generate gRPC code
protoc \
    --proto_path=src/10_distributed/grpc_service/proto \
    --go_out=src/10_distributed/grpc_service/pb --go_opt=paths=source_relative \
    --go-grpc_out=src/10_distributed/grpc_service/pb --go-grpc_opt=paths=source_relative \
    src/10_distributed/grpc_service/proto/user.proto

# 5. Verify everything builds
make build
```

## Makefile Commands

```bash
make run                                                  # Run hello world (default)
make run FILE=src/03_concurrency/01_goroutines/main.go    # Run specific file
make build                                                # Verify all modules compile
make test                                                 # Run all tests
make lint                                                 # Run go vet
make clean                                                # Clear Go cache
make help                                                 # Show all commands
```

## Project Architecture

```
GrinWithGolang/
├── src/                         # All runnable Go source files
│   ├── 01_foundations/          # Go from zero: types, functions, control flow
│   ├── 02_data_structures/      # Slices, maps, structs, generics
│   ├── 03_concurrency/          # Goroutines, channels, scheduler, lock-free
│   ├── 04_interfaces_design/    # Interfaces, composition, SOLID in Go
│   ├── 05_patterns/             # Functional options, worker pools, circuit breakers
│   ├── 06_networking/           # TCP, HTTP, WebSockets, gRPC
│   ├── 07_systems/              # Memory internals, GC, escape analysis, profiling
│   ├── 08_production/           # Project layout, error handling, testing, CI/CD
│   │   └── clean_backend/      # Separate Go module (has its own go.mod)
│   ├── 09_dsa/                  # DSA in Go: LRU, trie, segment tree, interviews
│   └── 10_distributed/          # Distributed systems (requires external deps)
│       ├── databases/           # MongoDB, PostgreSQL patterns
│       ├── grpc_service/        # Full gRPC service with protobuf
│       ├── messaging/           # Kafka (segmentio/kafka-go), NSQ
│       ├── observability/       # Prometheus + OpenTelemetry
│       └── kubernetes/          # K8s deployment manifests
├── docs/                        # MkDocs documentation
├── scripts/
│   └── setup.sh                 # Automated setup script
├── go.mod                       # Go module definition
├── go.sum                       # Dependency checksums
├── Makefile                     # Build commands
└── mkdocs.yml                   # Documentation config
```

## External Dependencies

The distributed systems module (`src/10_distributed/`) uses these third-party Go packages:

| Package | Purpose |
|---------|---------|
| `go.mongodb.org/mongo-driver` | MongoDB client |
| `github.com/jmoiron/sqlx` | PostgreSQL with struct mapping |
| `github.com/lib/pq` | PostgreSQL driver |
| `google.golang.org/grpc` | gRPC framework |
| `google.golang.org/protobuf` | Protocol Buffers |
| `github.com/segmentio/kafka-go` | Kafka client (pure Go, no CGO) |
| `github.com/nsqio/go-nsq` | NSQ messaging client |
| `github.com/prometheus/client_golang` | Prometheus metrics |
| `go.opentelemetry.io/otel` | OpenTelemetry tracing |

!!! tip "Why segmentio/kafka-go?"
    We use `segmentio/kafka-go` instead of `confluent-kafka-go` because it's a pure Go implementation no CGO or `librdkafka` C library required. This means it compiles everywhere Go compiles, with zero system dependencies.

## Sub-Modules

The `src/08_production/clean_backend/` directory is a **separate Go module** with its own `go.mod`. It has its own dependency tree (Gin, JWT, MongoDB, etc.) and is automatically skipped by `make build`. To build it separately:

```bash
cd src/08_production/clean_backend
go mod download
go build ./cmd/...
```

## Troubleshooting

??? warning "protoc-gen-go: program not found"
    Ensure `$(go env GOPATH)/bin` is in your `PATH`:
    ```bash
    export PATH="$PATH:$(go env GOPATH)/bin"
    ```
    Add this line to your `~/.zshrc` or `~/.bashrc` to make it permanent.

??? warning "missing go.sum entry"
    Run `go mod tidy` to sync the checksum database:
    ```bash
    go mod tidy
    ```

??? warning "make build shows FAILED for clean_backend"
    This is expected `clean_backend` has its own `go.mod` and is skipped by the build system. See the Sub-Modules section above.
