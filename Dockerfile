FROM phusion/baseimage:bionic-1.0.0
LABEL maintainer="mike@vkax.xyz"

ARG USER_ID
ARG GROUP_ID

ENV HOME /vkax

# add user with specified (or default) user/group ids
ENV USER_ID ${USER_ID:-1000}
ENV GROUP_ID ${GROUP_ID:-1000}
RUN groupadd -g ${GROUP_ID} vkax
RUN useradd -u ${USER_ID} -g vkax -s /bin/bash -m -d /vkax vkax
RUN mkdir /vkax/.vkaxcore
RUN chown vkax:vkax -R /vkax

ADD https://github.com/vkaxproject/vkax/releases/download/v18.0.3/vkaxcore-0.18.0.3-x86_64-pc-linux-gnu.tar.gz  /tmp/
RUN tar -xvf /tmp/vkaxcore-*.tar.gz -C /tmp/
RUN cp /tmp/vkaxcore*/bin/*  /usr/local/bin
RUN rm -rf /tmp/vkaxcore*

ADD ./bin /usr/local/bin
RUN chmod a+x /usr/local/bin/*

USER vkax

VOLUME ["/vkax"]

EXPOSE 11111 11110 22222 22220

WORKDIR /vkax

CMD ["vkax_mike"]
