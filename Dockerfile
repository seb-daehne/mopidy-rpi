FROM arm32v7/ubuntu:xenial
LABEL maintainer "Sebastian Daehne <daehne@rshc.de>"

ADD qemu-arm-static /usr/bin

RUN apt-get update && apt-get -y dist-upgrade && apt-get install -y wget

RUN wget -q -O - https://apt.mopidy.com/mopidy.gpg | apt-key add -
RUN wget -q -O /etc/apt/sources.list.d/mopidy.list https://apt.mopidy.com/stretch.list

RUN apt-get update  && apt-get -y install mopidy mopidy-spotify    
#RUN pip3 install Mopidy-GMusic Mopidy-Youtube youtube-dl pyasn1

#COPY mopidy.conf /home/mopidy/.config/mopidy/mopidy.conf

USER mopidy
ENTRYPOINT ["/usr/bin/mopidy"]
