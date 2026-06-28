# Module 9: Data Structures & Algorithms

Production-grade data structures implemented in Go LRU cache to segment trees.

## Topics

| # | Topic | Source | Key Concepts |
|---|-------|--------|--------------|
| 1 | LRU Cache | `src/09_dsa/01_lru_cache/main.go` | Doubly-linked list + map, O(1) get/put |
| 2 | Trie | `src/09_dsa/02_trie/main.go` | Prefix tree, autocomplete, word search |
| 3 | Ring Buffer | `src/09_dsa/03_ring_buffer/main.go` | Fixed-size circular buffer, overwrite policy |
| 4 | Concurrent Map | `src/09_dsa/04_concurrent_map/main.go` | Sharded map, lock striping, sync.Map comparison |
| 5 | Heap / Priority Queue | `src/09_dsa/05_heap_priority_queue/main.go` | container/heap interface, min/max heap |
| 6 | Union-Find | `src/09_dsa/06_union_find/main.go` | Path compression, union by rank, connected components |
| 7 | Segment Tree | `src/09_dsa/07_segment_tree/main.go` | Range queries, lazy propagation, build/update/query |
| 8 | Interview Patterns | `src/09_dsa/08_interview_patterns/main.go` | Sliding window, two pointers, monotonic stack |

## Run Any Example

```bash
go run src/09_dsa/01_lru_cache/main.go
```

## What You'll Learn

- Classic data structures implemented from scratch in Go
- Thread-safe concurrent map with sharding
- How to implement heap.Interface for priority queues
- Union-Find with optimizations for near-O(1) operations
- Common interview patterns with Go idioms
