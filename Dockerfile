FROM golang as base

LABEL maintainer="lwzm@qq.com"

ARG repo=github.com/yudai/gotty

RUN go get -d -v $repo \
    && cd src/$repo \
    && git checkout v1.0.1 \
    && CGO_ENABLED=0 go build -ldflags "-s -w" \
    && mv gotty /

FROM alpine

COPY --from=base /gotty /bin/
COPY .gotty /root/

EXPOSE 8080

ENTRYPOINT [ "gotty", "-w" ]
CMD [ "sh" ]
