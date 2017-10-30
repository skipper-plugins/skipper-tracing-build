.PHONY: docker-push

NAME     ?= skipper-tracing
VERSION  ?= $(shell git describe --tags --always --dirty)
# use registry.opensource.zalan.do/teapot/skipper-tracing:latest to pull
REGISTRY ?= registry-write.opensource.zalan.do/teapot
IMAGE    ?= $(REGISTRY)/$(NAME):$(VERSION)
GOPATH   = $(shell pwd)/build

default: docker-build

create-build:
	mkdir -p $(GOPATH)

skipper:
	go get -d github.com/zalando/skipper
	GOOS=linux GOARCH=amd64 CGO_ENABLED=1 go build github.com/zalando/skipper/cmd/skipper

eskip:
	GOOS=linux GOARCH=amd64 CGO_ENABLED=1 go build github.com/zalando/skipper/cmd/eskip

plugins:
	CUR=$(shell pwd) ;\
		go get -d github.com/skipper-plugins/opentracing ;\
		cd build/src/github.com/skipper-plugins/opentracing ;\
		GOOS=linux GOARCH=amd64 CGO_ENABLED=1 make ;\
		cp build/*.so $$CUR

clean:
	rm -f skipper eskip *.so
	rm -rf build/src/github.com/zalando/skipper

clean-all: clean
	rm -rf build

docker-build: clean create-build skipper eskip plugins
	docker build -t $(IMAGE) .

docker-push:
	docker push $(IMAGE)

