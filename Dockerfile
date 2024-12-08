FROM ruby:3.2.4-alpine3.20 as config_memo_base

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
RUN apk update && apk add --virtual build-dependencies --no-cache gcc g++ make git

WORKDIR /project


FROM config_memo_base as config_memo_dev

ARG USERNAME=devuser
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN apk add sudo shadow openssh-client \
    && addgroup --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

USER $USERNAME


FROM config_memo_base as config_memo_server

COPY . .

RUN bundle install
RUN apk del build-dependencies

CMD ["bundle", "exec", "jekyll", "serve", "-H", "0.0.0.0", "-P", "4000"]
