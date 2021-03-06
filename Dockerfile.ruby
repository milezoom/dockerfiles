FROM docker.io/bitnami/minideb as builder

RUN apt-get -y update && apt-get -y install apt-utils iproute2 curl git login unzip procps libpq-dev build-essential && \
    rm -rf /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Jakarta /etc/localtime && \
    gpg --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB && \
    curl -sSL https://get.rvm.io | bash -s stable && \
    bash -c "source /usr/local/rvm/scripts/rvm && rvm install ruby-2.5.1" && \
    echo "source /usr/local/rvm/scripts/rvm" >> /root/.bashrc && \
    mkdir -p /app

WORKDIR /app

CMD tail -f /dev/null