# Module 10: Distributed Systems

Service discovery, rate limiting, distributed locks, event sourcing, observability, and infrastructure.

!!! info "Prerequisites"
    This module uses external dependencies. Run `./scripts/setup.sh` or `go mod tidy` before building.
    See [Setup & Prerequisites](../setup.md) for details.

## Topics

| # | Topic | Source | Key Concepts |
|---|-------|--------|--------------|
| 1 | Service Discovery | `src/10_distributed/01_service_discovery/main.go` | Registry, health checks, DNS-based lookup |
| 2 | Rate Limiter | `src/10_distributed/02_rate_limiter/main.go` | Token bucket, sliding window, distributed rate limiting |
| 3 | Distributed Lock | `src/10_distributed/03_distributed_lock/main.go` | Redis-based lock, TTL, fencing tokens |
| 4 | Event Sourcing | `src/10_distributed/04_event_sourcing/main.go` | Event store, projections, CQRS |
| 5 | Observability | `src/10_distributed/05_observability/main.go` | Metrics, tracing, structured logging |
| 6 | MongoDB | `src/10_distributed/databases/mongo/` | Aggregation pipelines, change streams, indexes |
| 7 | PostgreSQL | `src/10_distributed/databases/postgres/` | sqlx, connection pooling, migrations, transactions |
| 8 | gRPC Service | `src/10_distributed/grpc_service/` | Protobuf, unary + streaming RPCs, interceptors |
| 9 | Kubernetes | `src/10_distributed/kubernetes/` | Deployments, services, health probes, HPA |
| 10 | Kafka | `src/10_distributed/messaging/kafka/` | Producer/consumer, partitioning, consumer groups |
| 11 | NSQ | `src/10_distributed/messaging/nsq/` | Pub/sub, channels, fan-out |
| 12 | Observability Stack | `src/10_distributed/observability/` | OpenTelemetry, Prometheus, Grafana, Tempo |

## External Dependencies

| Package | Purpose |
|---------|---------|
| `go.mongodb.org/mongo-driver` | MongoDB client |
| `github.com/jmoiron/sqlx` + `github.com/lib/pq` | PostgreSQL |
| `google.golang.org/grpc` + `google.golang.org/protobuf` | gRPC + Protobuf |
| `github.com/segmentio/kafka-go` | Kafka (pure Go, no CGO) |
| `github.com/nsqio/go-nsq` | NSQ messaging |
| `github.com/prometheus/client_golang` | Prometheus metrics |
| `go.opentelemetry.io/otel` | OpenTelemetry tracing |

!!! tip "Why segmentio/kafka-go?"
    We use `segmentio/kafka-go` instead of `confluent-kafka-go` because it's pure Go no CGO or `librdkafka` needed. Compiles everywhere Go compiles.

## Run Any Example

```bash
go run src/10_distributed/01_service_discovery/main.go
go run src/10_distributed/databases/mongo/main.go          # Requires MongoDB on :27017
go run src/10_distributed/databases/postgres/main.go       # Requires PostgreSQL on :5432
```

## gRPC Service

The gRPC module includes a full client/server with protobuf:

```bash
# Generate protobuf code (done automatically by setup.sh)
protoc --proto_path=src/10_distributed/grpc_service/proto \
    --go_out=src/10_distributed/grpc_service/pb --go_opt=paths=source_relative \
    --go-grpc_out=src/10_distributed/grpc_service/pb --go-grpc_opt=paths=source_relative \
    src/10_distributed/grpc_service/proto/user.proto

# Run server and client
go run src/10_distributed/grpc_service/cmd/server/main.go
go run src/10_distributed/grpc_service/cmd/client/main.go  # In another terminal
```

## What You'll Learn

- Building blocks for distributed systems in Go
- Rate limiting strategies for API protection
- Distributed locks for coordination across services
- Event sourcing + CQRS for audit-friendly architectures
- Full observability stack: metrics, traces, logs
- gRPC with protobuf: unary RPCs, server-streaming, interceptors
- Kafka producer/consumer with key-based partitioning
- Kubernetes-native Go services with proper health checks
