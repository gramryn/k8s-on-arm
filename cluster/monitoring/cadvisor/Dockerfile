FROM golang

RUN apt-get update && apt-get install -y git dmsetup && apt-get clean
RUN git clone https://github.com/google/cadvisor.git /go/src/github.com/google/cadvisor
RUN cd /go/src/github.com/google/cadvisor && build/build.sh

ENTRYPOINT ["/go/src/github.com/google/cadvisor/cadvisor","-logtostderr"]

#RUN apt-get update && apt-get install -y git dmsetup build-essential golang

#RUN go get github.com/google/cadvisor
#RUN go get github.com/tools/godep
#RUN cd /go && godep go build -a github.com/google/cadvisor

#RUN cp ./cadvisor /usr/bin/

EXPOSE 8080
#ENTRYPOINT ["/usr/bin/cadvisor", "-logtostderr"]
