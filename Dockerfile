FROM amazonlinux:latest

# install required tools
RUN yum -y update
RUN yum -y install git
RUN yum -y install golang
RUN go get -u github.com/ForceCLI/force

# copy the script
COPY ./sfci.sh $HOME/sfci.sh

# set the environment variables
ENV GOPATH="$HOME/go"
ENV PATH="$PATH:$GOPATH/bin"
