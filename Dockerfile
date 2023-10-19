FROM ubuntu
LABEL maintainer="pascal.stein@gmail.com"

RUN apt-get update && apt-get install -y openssh-client git locales

# Set the locale
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8  

ADD https://gitlab.com/lilypond/lilypond/-/releases/v2.24.2/downloads/lilypond-2.24.2-linux-x86_64.tar.gz ./
RUN tar -xvzf lilypond-2.24.2-linux-x86_64.tar.gz
ENV PATH /root/lilypond-2.24.2-linux-x86_64/bin/lilypond:$PATH
