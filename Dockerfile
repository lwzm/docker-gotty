FROM golang:alpine as base

LABEL maintainer="lwzm@qq.com"

RUN apk add git && go get -v -ldflags "-s -w" github.com/yudai/gotty

FROM alpine

COPY --from=base /go/bin/gotty /bin/

EXPOSE 8080

RUN apk add htop
ENTRYPOINT [ "gotty", "-w" ]
CMD [ "sh" ]
