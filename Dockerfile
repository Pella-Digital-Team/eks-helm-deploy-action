FROM public.ecr.aws/docker/library/python:3.13.9-slim-bookworm

ARG KUBECTL_VERSION=1.34.1
# Install the toolset.
RUN apt -y update && apt -y install curl \
    && pip install awscli \
    && curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash \
    && curl -fLO https://dl.k8s.io/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl \
    && chmod +x ./kubectl && mv ./kubectl /usr/local/bin/kubectl

COPY deploy.sh /usr/local/bin/deploy

CMD deploy
