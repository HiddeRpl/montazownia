FROM middleman:latest
MAINTAINER mikolaj.mlodzikowski@gmail.com
ADD . /app
RUN bundle install
ENTRYPOINT [ "middleman", "server", "-p", "80" ]
