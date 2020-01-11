
# Go parameters
GOCMD=go
GOBUILD=$(GOCMD) build
GOCLEAN=$(GOCMD) clean
GOTEST=$(GOCMD) test
GOGET=$(GOCMD) get
BINARY_NAME=go-cli-boilerplate.out
BINARY_UNIX=unix_$(BINARY_NAME)

all: test build
build:
				$(GOBUILD) -o $(BINARY_NAME) -v
test:
				$(GOTEST) -v ./...
clean:
				$(GOCLEAN)
				rm -f $(BINARY_NAME)
				rm -f $(BINARY_UNIX)
run:
				$(GOCLEAN)
				$(GOBUILD) -o $(BINARY_NAME) -v
				./$(BINARY_NAME)
deps:
				$(GOGET) github.com/spf13/cobra/cobra


# Cross compilation
build-linux:
				CGO_ENABLED=0 GOOS=linux GOARCH=amd64 $(GOBUILD) -o $(BINARY_UNIX) -v
docker-build:
				docker run --rm -it -v "$(GOPATH)":/go -w /go/src/github.com/patmizi/go-cli-boilerplate golang:latest go build -o "$(BINARY_UNIX)" -v