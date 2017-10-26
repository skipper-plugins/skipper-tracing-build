# Skipper opentracing build

This is an example project how to build a docker container of skipper with
opentracing plugins.

To build [skipper](https://github.com/zalando/skipper) with [skipper
opentracing plugins](https://github.com/skipper-plugins/opentracing)
use our Makefile:

    # local build
    % make docker-build

    # In order to use a custom docker registry set the REGISTRY variable.
    % make docker-build REGISTRY=mydocker-registry.org/myname
