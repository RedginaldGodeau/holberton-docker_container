FROM ubuntu

RUN apt-get update -yq \
&& apt-get upgrade -yq \
&& apt-get install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev libreadline-dev libffi-dev curl libbz2-dev pkg-config make -yq \
&& apt-get install gnupg zip unzip git wget -yq \
&& apt-get install nodejs -yq \
&& apt-get install mysql-server -yq\
&& apt-get install valgrind -yq\
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

RUN apt-get clean && rm -rf /var/lib/apt/lists/

RUN python3.8 -m pip install --upgrade pip
RUN pip install pep8

ADD ./workingdir /home
WORKDIR /home