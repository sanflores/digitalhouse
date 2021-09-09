FROM ubuntu

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y software-properties-common curl unzip pip vim git nano

RUN add-apt-repository --yes --update ppa:ansible/ansible  && \
    apt install -y ansible

# RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
#     unzip awscliv2.zip && ./aws/install

RUN pip install boto boto3 awscli

RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - && \
    apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
    apt-get install terraform

COPY validar_credenciales.sh validar_credenciales.sh

WORKDIR /infra-II

COPY clase7.yaml /infra-II/ansible/
COPY README_ansible.txt /infra-II/ansible/
COPY clase8.tf /infra-II/terraform/

CMD /validar_credenciales.sh && bash
