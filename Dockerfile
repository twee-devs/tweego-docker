FROM golang:latest AS build

LABEL maintainer="BDSMGeek <bdsmgeek@gmail.com>"

WORKDIR /tweego
RUN git clone https://github.com/tmedwards/tweego.git .
RUN go mod download
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o /bin/tweego .
RUN chmod +x /bin/tweego

FROM alpine:latest

WORKDIR /root/

RUN mkdir /storyformats /input /output

COPY --from=build /bin/tweego /bin/tweego
RUN export PATH="/bin/tweego:$PATH"

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

ENV LANG en_US.utf8

ENV TWEEGO_PATH="/storyformats"
ENV TWEEGO_FILE="index.html"
ENV TWEEGO_PARAMETERS=""

ENTRYPOINT ["./entrypoint.sh"]