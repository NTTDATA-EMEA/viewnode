VERSION = v0.0.1

.PHONY: build

clean:
	@go clean

build:
	@go build -ldflags="-s -w -X main.version=$(VERSION) -X main.commit=`git rev-parse HEAD`"

run:
	go run -ldflags="-s -w -X main.version=$(VERSION) -X main.commit=`git rev-parse HEAD`" main.go $(cmd)

install:
	@go install -ldflags="-s -w -X main.version=$(VERSION) -X main.commit=`git rev-parse HEAD`"

all: clean install

release:
	@goreleaser --snapshot --skip-publish --rm-dist