FROM golang
MAINTAINER yupeng <peng.yu@yibuyiyin.com>

RUN mkdir /go/src/app
WORKDIR /go/src/app
VOLUME /go/src/app

RUN go get -v github.com/kataras/iris \
    && go get -v github.com/tools/godep

CMD ../../bin/godep save
CMD ../../bin/iris run main.go

EXPOSE 8080
