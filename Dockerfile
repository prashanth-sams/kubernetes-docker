FROM ubuntu:latest

RUN apt-get update && apt-get install -y apt-transport-https curl libcurl4 gnupg
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN echo 'deb http://apt.kubernetes.io/ kubernetes-xenial main' > /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update
RUN apt-get install -y kubelet kubeadm kubectl
RUN apt-mark hold kubelet kubeadm kubectl

ENTRYPOINT ["tail", "-f", "/dev/null"]