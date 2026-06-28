# Module 6: Networking

TCP, HTTP, WebSocket, and gRPC building networked services in Go.

## Topics

| # | Topic | Source | Key Concepts |
|---|-------|--------|--------------|
| 1 | TCP Server | `src/06_networking/01_tcp_server/main.go` | net.Listen, Accept loop, concurrent connections |
| 2 | HTTP Server | `src/06_networking/02_http_server/main.go` | ServeMux, handlers, middleware, graceful shutdown |
| 3 | HTTP Client | `src/06_networking/03_http_client/main.go` | Custom transport, timeouts, connection pooling |
| 4 | WebSocket Basics | `src/06_networking/04_websocket_basics/main.go` | Upgrade, read/write loops, ping/pong |
| 5 | gRPC Concepts | `src/06_networking/05_grpc_concepts/main.go` | Protobuf, unary/streaming, interceptors |

## Run Any Example

```bash
go run src/06_networking/01_tcp_server/main.go
```

## What You'll Learn

- Go's net package for raw TCP one goroutine per connection
- HTTP server with zero dependencies (stdlib only)
- Client-side timeouts and connection reuse
- WebSocket for real-time bidirectional communication
- gRPC for high-performance service-to-service calls
