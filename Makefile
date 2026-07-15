# GrinWithGolang - The Ultimate Go Playbook
# Build and run any module

.PHONY: run build test lint clean help

# Usage: make run FILE=src/01_foundations/01_hello_world/main.go
FILE ?= src/01_foundations/01_hello_world/main.go

run:
	@echo "=== Running: $(FILE) ==="
	@go run $(FILE)

build:
	@echo "=== Building all modules ==="
	@find src -name "main.go" -exec dirname {} \; | sort | while read dir; do \
		skip=0; \
		d=$$dir; \
		while [ "$$d" != "src" ] && [ "$$d" != "." ]; do \
			if [ -f "$$d/go.mod" ]; then skip=1; break; fi; \
			d=$$(dirname $$d); \
		done; \
		if [ $$skip -eq 1 ]; then \
			echo "  Skipping $$dir (sub-module with own go.mod)"; \
			continue; \
		fi; \
		echo "  Building $$dir..."; \
		go build -o /dev/null ./$$dir 2>&1 || echo "  FAILED: $$dir"; \
	done
	@echo "=== Build check complete ==="

test:
	@go test ./... -v -count=1

lint:
	@go vet ./...
	@echo "go vet passed"

clean:
	@go clean -cache
	@echo "Cache cleaned"

help:
	@echo "GrinWithGolang - Ultimate Go Playbook"
	@echo ""
	@echo "  make run FILE=src/01_foundations/01_hello_world/main.go"
	@echo "  make build     # Verify all files compile"
	@echo "  make test      # Run all tests"
	@echo "  make lint      # Run go vet"
