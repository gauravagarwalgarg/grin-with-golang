# Module 10: Distributed Systems

Service discovery, rate limiting, distributed locks, event sourcing, observability, and infrastructure.

## Topics

| # | Topic | Source | Key Concepts |
|---|-------|--------|--------------|
| 1 | Service Discovery | `src/10_distributed/01_service_discovery/main.go` | Registry, health checks, DNS-based lookup |
| 2 | Rate Limiter | `src/10_distributed/02_rate_limiter/main.go` | Token bucket, sliding window, distributed rate limiting |
| 3 | Distributed Lock | `src/10_distributed/03_distributed_lock/main.go` | Redis-based lock, TTL, fencing tokens |
| 4 | Event Sourcing | `src/10_distributed/04_event_sourcing/main.go` | Event store, projections, CQRS |
| 5 | Observability | `src/10_distributed/05_observability/main.go` | Metrics, tracing, structured logging |
| 6 | Databases | `src/10_distributed/databases/` | Connection pooling, migrations, transactions |
| 7 | gRPC Service | `src/10_distributed/grpc_service/` | Full gRPC service, interceptors, streaming |
| 8 | Kubernetes | `src/10_distributed/kubernetes/` | Deployments, services, health probes |
| 9 | Messaging | `src/10_distributed/messaging/` | Kafka, message queues, event-driven architecture |
| 10 | Observability (Advanced) | `src/10_distributed/observability/` | OpenTelemetry, Prometheus, Grafana |

## Run Any Example

```bash
go run src/10_distributed/01_service_discovery/main.go
```

## What You'll Learn

- Building blocks for distributed systems in Go
- Rate limiting strategies for API protection
- Distributed locks for coordination across services
- Event sourcing + CQRS for audit-friendly architectures
- Full observability stack: metrics, traces, logs
- Kubernetes-native Go services with proper health checks
