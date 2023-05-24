# Исход билд
FROM golang:1.16.4-alpine AS builder
WORKDIR /app
COPY . .
RUN go build -o mif

# конт без изх
FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=builder /app/mif .
EXPOSE 3535
CMD ["./mif"]
