// Kafka Consumer subscribes to a topic and processes events with a consumer group.
//
// LEARNING NOTES:
// - Consumer groups: Kafka assigns partitions to consumers in a group automatically
// - Rebalancing: when a consumer joins/leaves, partitions are redistributed
// - Offset commit: tracks where each consumer left off (survives restarts)
// - "At-least-once" by default: commit after processing (may reprocess on crash)
// - "Exactly-once" requires idempotent writes or transactional processing
//
// Using segmentio/kafka-go: pure Go client (no CGO/librdkafka needed).
//
// Run: go run consumer/main.go
// Requires: Kafka broker on localhost:9092
package main

import (
	"context"
	"encoding/json"
	"fmt"
	"log"
	"os"
	"os/signal"
	"syscall"

	kafkago "github.com/segmentio/kafka-go"
)

type PaymentEvent struct {
	PaymentID string  `json:"payment_id"`
	OrderID   string  `json:"order_id"`
	UserID    string  `json:"user_id"`
	Amount    float64 `json:"amount"`
	Status    string  `json:"status"`
	Timestamp int64   `json:"timestamp"`
}

func main() {
	// kafka-go Reader = consumer with consumer group support
	reader := kafkago.NewReader(kafkago.ReaderConfig{
		Brokers: []string{"localhost:9092"},
		Topic:   "payments",
		GroupID: "payment-processor", // Consumer group
		// StartOffset: kafkago.FirstOffset, // Start from beginning if no offset stored (default with GroupID)
	})
	defer reader.Close()

	fmt.Println("Kafka consumer started. Waiting for messages...")

	// Graceful shutdown
	ctx, cancel := context.WithCancel(context.Background())
	sigChan := make(chan os.Signal, 1)
	signal.Notify(sigChan, syscall.SIGINT, syscall.SIGTERM)

	go func() {
		<-sigChan
		fmt.Println("\nShutdown signal received...")
		cancel()
	}()

	for {
		msg, err := reader.ReadMessage(ctx)
		if err != nil {
			if ctx.Err() != nil {
				break // Context cancelled, clean shutdown
			}
			log.Printf("Consumer error: %v", err)
			continue
		}

		var event PaymentEvent
		if err := json.Unmarshal(msg.Value, &event); err != nil {
			log.Printf("Unmarshal error: %v", err)
			continue
		}

		// Process the event
		fmt.Printf("[Partition %d | Offset %d] Payment: %s | User: %s | $%.2f | %s\n",
			msg.Partition,
			msg.Offset,
			event.PaymentID,
			event.UserID,
			event.Amount,
			event.Status,
		)
	}

	fmt.Println("Consumer shutting down...")
}
