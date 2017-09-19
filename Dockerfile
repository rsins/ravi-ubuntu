FROM ubuntu:latest

MAINTAINER Ravi Singh 

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm-256color
ENV HOME /root
ENV SOURCE_FILES ./files

RUN apt-get update -y && apt-get clean all
RUN apt-get install -y software-properties-common && apt-get update -y && apt-get clean all
RUN apt-get install -y man inxi wget aria2 lynx git colordiff colortail unzip tar vim tmux xterm curl tree && apt-get clean all

COPY ${SOURCE_FILES}/tmux.conf ${HOME}/.tmux.conf
COPY ${SOURCE_FILES}/vimrc ${HOME}/.vimrc
COPY ${SOURCE_FILES}/inputrc ${HOME}/.inputrc
COPY ${SOURCE_FILES}/bashrc ${HOME}/bashrc
RUN printf "\n# ----------- Docker Build Information ----------------\n" >> ${HOME}/.bashrc
RUN printf "export DOCKER_VM=docker-ubuntu\n" >> ${HOME}/.bashrc
RUN printf "export DOCKER_VM_BUILD_TIME=`date '+%Y-%b-%d %r %Z'`\n" >> ${HOME}/.bashrc
RUN cat ${HOME}/bashrc >> ${HOME}/.bashrc
RUN rm -f ${HOME}/bashrc

CMD ["/bin/bash"]

