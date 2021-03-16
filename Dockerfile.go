FROM golang:alpine3.8

RUN apk add --no-cache bash git openssh

RUN git clone \
	--config transfer.fsckobjects=false \
	--config receive.fsckobjects=false \
	--config fetch.fsckobjects=false \
	https://github.com/github/hub.git "$GOPATH"/src/github.com/github/hub

RUN cd $GOPATH/src/github.com/github/hub/ && ./script/build -o bin/hub

RUN echo 'alias hub="$GOPATH/src/github.com/github/hub/bin/hub"' >> ~/.bashrc

RUN mkdir /root/.ssh
RUN ssh-keyscan -t rsa github.com > /root/.ssh/known_hosts
COPY id_rsa /root/.ssh/id_rsa
RUN rm -rf id_rsa
RUN chmod 0400 /root/.ssh/id_rsa


ENV APP_HOME /dotfiles
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
COPY . $APP_HOME

RUN cd /dotfiles
CMD bash
