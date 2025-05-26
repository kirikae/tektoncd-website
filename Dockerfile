FROM floryn90/hugo:ext-ubuntu as website
USER root
COPY . /src
RUN apt -y update && apt -y install git build-essential python3-venv python3-pip
RUN git config --global --add safe.directory /src
RUN npm install
RUN npm install -g netlify-cli
RUN chown -R root:root /home/hugo && chown -R root:root /src && chmod a+wrx /src

RUN pip install -r /src/requirements.txt --break-system-packages

ENTRYPOINT ["/usr/bin/netlify"]
CMD ["dev"]
