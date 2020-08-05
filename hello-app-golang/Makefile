# Go parameters
GOCMD=go
GOBUILD=$(GOCMD) build
GOCLEAN=$(GOCMD) clean
GOTEST=$(GOCMD) test
GOGET=$(GOCMD) get
DOCKER_PATH="emreodabas/hello-app"
VERSION="golang"
BINARY_NAME=hello_app
BINARY_UNIX=$(BINARY_NAME)_unix
all: test build
build:
	$(GOBUILD) -o out/$(BINARY_NAME) -v
test:
	$(GOTEST) -v ./...
clean:
	$(GOCLEAN)
	rm -f out/$(BINARY_NAME)
	rm -f out/$(BINARY_UNIX)
run:
	$(GOBUILD) -o out/$(BINARY_NAME)
	out/$(BINARY_NAME)
depinit:
	dep init
depensure:
	dep ensure
build-linux:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 $(GOBUILD) -a -installsuffix cgo -ldflags '-extldflags "-static"' -o $(BINARY_UNIX)
docker-build:
	docker build -t $(DOCKER_PATH):$(VERSION) .
release:
	$(MAKE) clean
	$(MAKE) build-linux
	$(MAKE) docker-build
	docker login --username emreodabas
	docker push $(DOCKER_PATH):$(VERSION)