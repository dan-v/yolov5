FROM gocv/opencv:4.5.4

# Install dependencies
RUN curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.42.1
RUN go get -u github.com/rakyll/gotest

COPY . /go/src/github.com/wimspaargaren/yolov5

WORKDIR /go/src/github.com/wimspaargaren/yolov5
# In order to test a happy flow we need to have the actual config and weights
RUN make models