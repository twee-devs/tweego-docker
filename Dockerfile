FROM golang:latest AS build

LABEL maintainer="BDSMGeek <bdsmgeek@gmail.com>"

WORKDIR /tweego
RUN git clone https://github.com/tmedwards/tweego.git .
RUN go mod download
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

FROM alpine:latest
WORKDIR /root/
COPY --from=build /tweego/main .
COPY entrypoint.sh .
RUN mkdir /storyformats /input /output
ENV TWEEGO_PATH="/storyformats"
ENV TWEEGO_OUTFILE="index.html"
ENTRYPOINT ["./entrypoint.sh"]