FROM ubuntu:24.10

# Add Docker's official GPG key:
RUN apt-get update
RUN apt-get install ca-certificates curl -y
RUN install -m 0755 -d /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
RUN chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
RUN echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN apt-get update && apt-get install -y docker-ce-cli docker-compose-plugin


RUN apt-get update && apt-get install -y wget supervisor cron restic rclone inotify-tools ssh

RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY scripts /opt/scripts
COPY start.sh /start.sh
RUN chmod +x /start.sh


ENV RESTICPROFILE_VERSION='v0.29.0'
ENV YQ_VERSION='v4.44.6'


RUN curl -sfL https://raw.githubusercontent.com/creativeprojects/resticprofile/$RESTICPROFILE_VERSION/install.sh | sh

RUN wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq &&\
  chmod +x /usr/bin/yq

CMD ["bash", "-c", "/start.sh"]