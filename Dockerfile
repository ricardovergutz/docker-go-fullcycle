FROM golang:1.18.7-alpine3.15 AS builder
WORKDIR /app
COPY . .
RUN go build hello-world.go
CMD [ "./hello-world" ] 


FROM hello-world
WORKDIR /app
COPY --from=builder /app/hello-world .
CMD [ "./hello-world" ] 
