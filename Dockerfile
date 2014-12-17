FROM ubuntu
RUN apt-get update
RUN apt-get install -y python-pip python-dev
RUN pip install supervisor --pre
RUN pip install flask
RUN pip install uwsgi
RUN apt-get install -y curl
RUN apt-get install -y nginx
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
ADD sampleapp /mnt/app/sampleapp
ADD supervisord.conf /mnt/app/
ADD deneme_nginx.conf /mnt/app/
WORKDIR /mnt/app
RUN cp deneme_nginx.conf /etc/nginx/sites-enabled/default
EXPOSE 5000
EXPOSE 80
