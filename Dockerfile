# Исход билд
FROM golang:1.16.4-alpine AS builder
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY *.go ./

RUN CGO_ENABLED=0 GOOS=linux go build -o /mif

FROM build-stage AS run-test-stage
RUN go test -v ./...

# конт без изх
FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /

COPY --from=build-stage /mif /mif

EXPOSE 3535

USER nonroot:nonroot

ENTRYPOINT ["/mif"]
