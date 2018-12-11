export GO111MODULE=on

BINARY_VERSION?=0.0.1
EXTRA_FLAGS?=-mod=vendor

all: deps build
install:
	go install -v $(EXTRA_FLAGS) -ldflags "-X main.Version=$(BINARY_VERSION)" ./...
build:
	go build -v $(EXTRA_FLAGS) -ldflags "-X main.Version=$(BINARY_VERSION)"
test:
	go test -v $(EXTRA_FLAGS)-race -coverprofile=coverage.txt -covermode=atomic ./...
clean:
	go clean
	rm -f $(BINARY_NAME)
deps:
	go build -v $(EXTRA_FLAGS) ./...
upgrade:
	go get -u
version:
	clobber --version
