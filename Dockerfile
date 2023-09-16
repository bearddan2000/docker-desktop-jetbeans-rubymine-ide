FROM ubuntu:20.04

# Needed for X11 forwarding
ENV DISPLAY :0

# Needed for X11 forwarding
ENV USERNAME developer

WORKDIR /app

RUN apt update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    dirmngr ca-certificates \
    software-properties-common \
    apt-transport-https \
    curl lsb-release openjdk-17-jdk \
    openjdk-17-jre libswt-gtk-4-java \
    ruby-full

# setup jetbeans repo
RUN curl -s https://s3.eu-central-1.amazonaws.com/jetbrains-ppa/0xA6E8698A.pub.asc | gpg --dearmor | tee /usr/share/keyrings/jetbrains-ppa-archive-keyring.gpg > /dev/null

RUN echo "deb [signed-by=/usr/share/keyrings/jetbrains-ppa-archive-keyring.gpg] http://jetbrains-ppa.s3-website.eu-central-1.amazonaws.com any main" | tee /etc/apt/sources.list.d/jetbrains-ppa.list > /dev/null

RUN apt update

# install rubymine
RUN DEBIAN_FRONTEND=noninteractive apt install -yq rubymine

# create and switch to a user
RUN echo "backus ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN useradd --no-log-init --home-dir /home/$USERNAME --create-home --shell /bin/bash $USERNAME
RUN adduser $USERNAME root

USER $USERNAME

WORKDIR /home/$USERNAME

CMD "rubymine"