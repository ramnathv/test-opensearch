FROM gitpod/workspace-full:legacy-dazzle-v1

RUN sudo apt-get install -y graphviz
RUN pyenv install 3.9.7

# Install python packages
COPY requirements.txt /tmp/
RUN pip install --requirement /tmp/requirements.txt

# Install logstash
RUN curl -o logstash-oss-with-opensearch-output-plugin-7.13.2-linux-x64.tar.gz https://artifacts.opensearch.org/logstash/logstash-oss-with-opensearch-output-plugin-7.13.2-linux-x64.tar.gz
RUN tar -xf logstash-oss-with-opensearch-output-plugin-7.13.2-linux-x64.tar.gz
RUN rm logstash-oss-with-opensearch-output-plugin-7.13.2-linux-x64.tar.gz

# Install fasttext
RUN wget https://github.com/facebookresearch/fastText/archive/v0.9.2.zip
RUN unzip v0.9.2.zip
RUN cd /home/gitpod/fastText-0.9.2 && /usr/bin/make -f /home/gitpod/fastText-0.9.2/Makefile fasttext
RUN rm v0.9.2.zip
