FROM ubuntu

ENV PATH /root/.local/bin:$PATH

RUN apt-get update && \
    apt-get install -y python curl apt-transport-https ca-certificates software-properties-common && \
    curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py --user && \
    pip install awscli --upgrade --user && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    apt-key fingerprint 0EBFCD88 && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get install docker-ce -y && \
    apt-get install jq -y && \
    apt-get install zip -y
