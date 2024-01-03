FROM rundeck/rundeck:4.17.3
LABEL maintainer="DevOpsify Community <support@devopsify.co>"

# Args
ARG BUILD_DATE
ARG REVISION
ARG BUILD_VERSION
ARG TIMEZONE=Asia/Ho_Chi_Minh

# Labels
LABEL \
    org.opencontainers.image.authors="DevOpsify <info@devopsify.co>" \
    org.opencontainers.image.created=$BUILD_DATE \
    org.opencontainers.image.title="huyntt/rundeck" \
    org.opencontainers.image.description="Default image for DevOpsify Pipelines" \
    org.opencontainers.image.url="https://devopsify.co/" \
    org.opencontainers.image.vendor="DevOpsify" \
    org.opencontainers.image.revision=$REVISION \
    org.opencontainers.image.version=$BUILD_VERSION

RUN sudo apt-get update
RUN sudo apt-get install -y python3 python3-pip
RUN pip install requests &&  pip install urllib3 && pip install pywinrm

# RUN ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa <<< y
# COPY --chown=rundeck:root data/resources.yml /home/rundeck
# COPY data/plugins/. /home/rundeck/libext