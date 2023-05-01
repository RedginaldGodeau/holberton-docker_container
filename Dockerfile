FROM ubuntu

RUN apt-get update -yq \
&& apt-get upgrade -yq \
&& apt-get install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev libreadline-dev libffi-dev curl libbz2-dev pkg-config make -yq \
&& apt-get install gnupg zip unzip git wget vim -yq \
&& apt-get install nodejs npm -yq \
&& apt-get install mysql-server -yq\
&& apt-get install valgrind -yq\
&& apt-get install golang -yq \
&& git clone https://github.com/hs-hq/Betty.git \
&& cd ./Betty && ./install.sh && cd ..  && rm -r ./Betty

RUN cd /opt \
&& wget https://www.python.org/ftp/python/3.8.5/Python-3.8.5.tgz \
&& tar xzf Python-3.8.5.tgz \
&& cd Python-3.8.5 \
&& ./configure --enable-optimizations \
&& make altinstall \
&& cd /opt \
&& rm -f Python-3.8.5.tgz

RUN wget https://github.com/gohugoio/hugo/releases/download/v0.84.1/hugo_extended_0.84.1_Linux-64bit.tar.gz \
&& tar -xzvf hugo_extended_0.84.1_Linux-64bit.tar.gz \
&& mv hugo /usr/local/bin/ \
&& rm hugo_extended_0.84.1_Linux-64bit.tar.gz

RUN apt-get clean && rm -rf /var/lib/apt/lists/

RUN python3.8 -m pip install --upgrade pip
RUN pip install pep8

ADD ./workingdir /home
WORKDIR /home