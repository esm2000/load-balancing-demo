# setup nginx reverse proxy
FROM nginx:alpine
RUN rm -rf /etc/nginx/conf.d/default.conf
COPY ./demo.conf /etc/nginx/conf.d/demo.conf

# copy contents to directory
WORKDIR /app
COPY . .

# install python
RUN apk add --update --no-cache python3 bash && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --upgrade pip && \
    pip3 install --no-cache-dir -r /app/requirements.txt 

ENTRYPOINT ["./run.sh"]