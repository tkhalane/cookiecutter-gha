# Use the Alpine Linux base image
FROM python:3.11-alpine

RUN apk update && \
    apk add --no-cache jq \
    curl \ 
    git \
    openssh-client \
    bash \
    && pip3 install cookiecutter && pip3 install six

    # Install Helm
RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
RUN chmod 700 get_helm.sh
RUN ./get_helm.sh

# Clean up unnecessary files
RUN rm get_helm.sh
COPY *.sh /
RUN chmod +x /*.sh

ENTRYPOINT ["/entrypoint.sh"]