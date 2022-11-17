# Stage 1 Build the Golang Image
FROM golang:alpine AS builder 

WORKDIR /app

COPY ./go.mod ./
#COPY ./go.sum ./

RUN go mod tidy

COPY *.go ./

COPY /printstuff ./printstuff

RUN go build -o ./worker

# Stage 2 Run the build binary 
FROM alpine 

WORKDIR /app

COPY --from=builder /app/worker ./

CMD [ "./worker" ]