#!/usr/bin/env bash
# GrinWithGolang - Setup Script
# Installs all prerequisites and verifies the build.
#
# Usage:
#   chmod +x scripts/setup.sh
#   ./scripts/setup.sh

set -euo pipefail

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

info()  { echo -e "${GREEN}[✓]${NC} $*"; }
warn()  { echo -e "${YELLOW}[!]${NC} $*"; }
fail()  { echo -e "${RED}[✗]${NC} $*"; exit 1; }

echo "========================================="
echo "  GrinWithGolang - Setup"
echo "========================================="
echo ""

# ---------------------------------------------------
# 1. Check Go
# ---------------------------------------------------
if command -v go &>/dev/null; then
    GO_VERSION=$(go version | awk '{print $3}')
    info "Go found: $GO_VERSION"
else
    fail "Go is not installed. Install from https://go.dev/dl/"
fi

# ---------------------------------------------------
# 2. Check / Install protoc (for gRPC module)
# ---------------------------------------------------
if command -v protoc &>/dev/null; then
    info "protoc found: $(protoc --version 2>/dev/null || echo 'unknown')"
else
    warn "protoc not found required for gRPC module"
    if command -v brew &>/dev/null; then
        echo "    Installing via Homebrew..."
        brew install protobuf
        info "protoc installed"
    else
        warn "Install protobuf manually: https://grpc.io/docs/protoc-installation/"
        warn "On Ubuntu/Debian: sudo apt install -y protobuf-compiler"
        warn "On macOS: brew install protobuf"
    fi
fi

# ---------------------------------------------------
# 3. Install Go protoc plugins (for gRPC code generation)
# ---------------------------------------------------
echo ""
echo "Installing Go protoc plugins..."
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest 2>/dev/null
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest 2>/dev/null
info "protoc-gen-go and protoc-gen-go-grpc installed"

# Ensure GOPATH/bin is in PATH
GOBIN="$(go env GOPATH)/bin"
if [[ ":$PATH:" != *":$GOBIN:"* ]]; then
    warn "Add $(go env GOPATH)/bin to your PATH:"
    echo "    export PATH=\"\$PATH:$(go env GOPATH)/bin\""
    export PATH="$PATH:$GOBIN"
fi

# ---------------------------------------------------
# 4. Generate gRPC protobuf code
# ---------------------------------------------------
echo ""
echo "Generating gRPC protobuf code..."
PROTO_DIR="src/10_distributed/grpc_service/proto"
PB_DIR="src/10_distributed/grpc_service/pb"

if [ -f "$PROTO_DIR/user.proto" ]; then
    mkdir -p "$PB_DIR"
    protoc \
        --proto_path="$PROTO_DIR" \
        --go_out="$PB_DIR" --go_opt=paths=source_relative \
        --go-grpc_out="$PB_DIR" --go-grpc_opt=paths=source_relative \
        "$PROTO_DIR/user.proto"
    info "Generated pb files in $PB_DIR"
else
    warn "Proto file not found at $PROTO_DIR/user.proto skipping"
fi

# ---------------------------------------------------
# 5. Download Go dependencies
# ---------------------------------------------------
echo ""
echo "Downloading Go dependencies..."
go mod download
go mod tidy
info "Dependencies synced (go.mod + go.sum)"

# ---------------------------------------------------
# 6. Verify build
# ---------------------------------------------------
echo ""
echo "Verifying build..."
FAIL_COUNT=0
SKIP_COUNT=0
PASS_COUNT=0

find src -name "main.go" -exec dirname {} \; | sort | while read dir; do
    # Skip sub-modules with their own go.mod
    skip=0
    d="$dir"
    while [ "$d" != "src" ] && [ "$d" != "." ]; do
        if [ -f "$d/go.mod" ]; then skip=1; break; fi
        d=$(dirname "$d")
    done

    if [ $skip -eq 1 ]; then
        SKIP_COUNT=$((SKIP_COUNT + 1))
        continue
    fi

    if go build -o /dev/null "./$dir" 2>/dev/null; then
        PASS_COUNT=$((PASS_COUNT + 1))
    else
        echo -e "  ${RED}FAILED${NC}: $dir"
        FAIL_COUNT=$((FAIL_COUNT + 1))
    fi
done

echo ""
echo "========================================="
if [ $FAIL_COUNT -eq 0 ] 2>/dev/null; then
    info "Setup complete! All modules compile successfully."
else
    warn "Setup complete with some build issues (see above)."
fi
echo ""
echo "Next steps:"
echo "  make run                                          # Run hello world"
echo "  make run FILE=src/01_foundations/02_variables_types/main.go  # Run specific file"
echo "  make build                                        # Verify all modules"
echo "  make test                                         # Run tests"
echo "========================================="
