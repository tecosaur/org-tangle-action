FROM alpine:3.13

ENV LANG=C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

RUN apk add --no-cache openssh-client git emacs-nox python3

RUN printf "Host github.com\n  StrictHostKeyChecking no\n" >> /etc/ssh/ssh_config

COPY knit/ /opt/org-knit/

ENTRYPOINT ["python3", "-u", "/opt/org-knit/main.py"]
