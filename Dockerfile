FROM ubuntu:latest

RUN apt-get update && apt-get install -y apt-transport-https curl libcurl4 gnupg wget
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN echo 'deb http://apt.kubernetes.io/ kubernetes-xenial main' > /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update
RUN apt-get install -y kubelet kubeadm kubectl
RUN apt-mark hold kubelet kubeadm kubectl docker.io

# helm installation
ENV LC_ALL=en_US.UTF-8
RUN wget "https://storage.googleapis.com/kubernetes-helm/helm-$(wget -qO- https://github.com/kubernetes/helm/releases | sed -n '/Latest release<\/a>/,$p' | grep -oE 'v[0-9]+\.[0-9]+\.[0-9]+' |head -1)-linux-amd64.tar.gz" -P /tmp/
RUN tar -xzf /tmp/helm-v2.* -C /tmp/
RUN chmod a+x /tmp/linux-amd64/helm
RUN mv /tmp/linux-amd64/helm /usr/bin/helm

ENTRYPOINT ["tail", "-f", "/dev/null"]