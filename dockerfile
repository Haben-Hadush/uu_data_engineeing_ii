FROM busybox:latest
MAINTAINER habenhadush
ADD demo.sh
WORKDIR /demo/
CMD ./demo.sh
