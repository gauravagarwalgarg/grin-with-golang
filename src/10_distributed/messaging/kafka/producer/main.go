// Kafka Producer publishes events to a Kafka topic with partitioning.
//
// LEARNING NOTES:
// - Kafka = distributed commit log. Messages are ordered within a partition.
// - Partitions enable parallelism: more partitions = more consumers in a group
// - Key-based partitioning: same key → same partition → guaranteed ordering for that key
// - Kafka retains messages (default 7 days) consumers can replay from any offset
// - vs NSQ: Kafka has stronger ordering, replay ability, but heavier ops
//
// For C++ devs: Kafka is like a distributed ring buffer with persistent storage
// and consumer offset tracking (similar to shared memory segments with seek).
//
// Using segmentio/kafka-go: pure Go client (no CGO/librdkafka needed).
//
// Run: go run producer/main.go
// Requires: Kafka broker on localhost:9092
package main

import (
	"context"
	"encoding/json"
	"fmt"
	"log"
	"time"

	kafkago "github.com/segmentio/kafka-go"
)

type PaymentEvent struct {
	PaymentID string  `json:"payment_id"`
	OrderID   string  `json:"order_id"`
	UserID    string  `json:"user_id"`
	Amount    float64 `json:"amount"`
	Status    string  `json:"status"` // pending, completed, failed
	Timestamp int64   `json:"timestamp"`
}

func main() {
	// kafka-go uses a Writer abstraction (handles batching, retries, partitioning)
	writer := &kafkago.Writer{
		Addr:         kafkago.TCP("localhost:9092"),
		Topic:        "payments",
		Balancer:     &kafkago.Hash{},       // Key-based partitioning: same key → same partition
		RequiredAcks: kafkago.RequireAll,    // Wait for all replicas (strongest durability)
		BatchTimeout: 10 * time.Millisecond, // Batch messages for 10ms (throughput vs latency tradeoff)
		MaxAttempts:  5,                     // Retry on transient failures
	}
	defer writer.Close()

	// Publish 10 payment events
	for i := 1; i <= 10; i++ {
		event := PaymentEvent{
			PaymentID: fmt.Sprintf("pay_%d", i),
			OrderID:   fmt.Sprintf("order_%d", i),
			UserID:    fmt.Sprintf("user_%d", i%3+1),
			Amount:    float64(i) * 49.99,
			Status:    "completed",
			Timestamp: time.Now().UnixMilli(),
		}

		body, _ := json.Marshal(event)

		// Key = UserID → all events for the same user go to the same partition (ordered)
		err := writer.WriteMessages(context.Background(), kafkago.Message{
			Key:   []byte(event.UserID),
			Value: body,
		})

		if err != nil {
			log.Printf("Produce error: %v", err)
		} else {
			fmt.Printf("Sent: %s ($%.2f)\n", event.PaymentID, event.Amount)
		}

		time.Sleep(200 * time.Millisecond)
	}

	fmt.Println("\nAll payment events published!")
}
