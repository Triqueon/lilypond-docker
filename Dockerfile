FROM ubuntu
LABEL maintainer="pascal.stein@gmail.com"

RUN apt-get update && apt-get install -y openssh-client git locales

# Set the locale
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8  

ADD https://lilypond.org/download/binaries/linux-64/lilypond-2.20.0-1.linux-64.sh ./
RUN chmod +x lilypond-2.20.0-1.linux-64.sh
RUN ./lilypond-2.20.0-1.linux-64.sh --batch --prefix /root/stable
RUN rm lilypond-2.20.0-1.linux-64.sh

ENV PATH /root/stable/bin:$PATH
