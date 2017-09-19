FROM ubuntu:latest

MAINTAINER Ravi Singh 

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm-256color
ENV HOME /root
ENV SOURCE_FILES ./files

RUN apt-get update -y && apt-get clean all
RUN apt-get install -y software-properties-common && apt-get update -y && apt-get clean all
RUN apt-get install -y git colordiff colortail unzip vim tmux xterm zsh curl tree && apt-get clean all

COPY ${SOURCE_FILES}/bash_aliases ${HOME}/.bash_aliases
COPY ${SOURCE_FILES}/tmux.conf ${HOME}/.tmux.conf
COPY ${SOURCE_FILES}/vimrc ${HOME}/.vimrc
COPY ${SOURCE_FILES}/inputrc ${HOME}/.inputrc
RUN printf "export DOCKER_VM=docker-ubuntu" >> ${HOME}/.bash_aliases

CMD ["/bin/bash"]

