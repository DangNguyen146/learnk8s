FROM python:alpine3.15
ENV TZ=Asia/Ho_Chi_Minh
RUN mkdir -p /data/apps
ADD . /user/app
WORKDIR /user/app
RUN pip install -r requirements.txt
CMD tail -f /dev/null

