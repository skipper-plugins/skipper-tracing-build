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

    % docker run mydocker-registry.org/myname:422346257bc74aef30df9946a7755e8e3d0be8eb -opentracing noop
    [APP]time="2017-10-26T14:37:15Z" level=warning msg="no route source specified"
    [APP]time="2017-10-26T14:37:15Z" level=info msg="support listener on :9911"
    [APP]time="2017-10-26T14:37:15Z" level=info msg="proxy listener on :9090"
    [APP]time="2017-10-26T14:37:15Z" level=info msg="certPathTLS or keyPathTLS not found, defaulting to HTTP"
