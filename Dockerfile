FROM centos:8

RUN yum update -y && yum install unzip -y

ENV HOME="/root"

WORKDIR $HOME

RUN curl -fsSL https://deno.land/x/install/install.sh | sh

ENV DENO_INSTALL="$HOME/.deno"

ENV PATH="$DENO_INSTALL/bin:$PATH"

RUN mkdir -p $HOME/app

COPY ./main.ts $HOME/app

WORKDIR $HOME/app