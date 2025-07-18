FROM golang:1.22-alpine AS build
WORKDIR /src
COPY . .
RUN go build -o server .

FROM alpine:3.20
COPY --from=build /src/server /server
EXPOSE 8080
ENTRYPOINT ["/server"]
