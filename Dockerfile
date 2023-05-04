FROM ubuntu:latest
RUN apt update && \
    apt install -y git build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev
WORKDIR /
RUN wget https://www.python.org/ftp/python/3.11.3/Python-3.11.3.tgz
RUN tar -xf Python-3.11.3.tgz
WORKDIR /Python-3.11.3
RUN ./configure --enable-optimizations
RUN make -j 12
RUN make altinstall
WORKDIR /root
WORKDIR /root/A
WORKDIR /root/B
WORKDIR /root/C
WORKDIR /root/files
RUN touch a.txt && touch b.txt && touch c.txt
WORKDIR /root
RUN git clone https://github.com/tongticktack/OSSP_week4.git

