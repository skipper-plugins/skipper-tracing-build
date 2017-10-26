FROM frolvlad/alpine-glibc
MAINTAINER Skipper Maintainers <team-teapot@zalando.de>
RUN apk --no-cache add ca-certificates && update-ca-certificates
RUN mkdir -p /usr/bin
ADD skipper eskip skipper.sh /usr/bin/
ENV PATH $PATH:/usr/bin
RUN mkdir -p /plugins
ADD *.so /plugins/
ENTRYPOINT ["/usr/bin/skipper.sh"]
