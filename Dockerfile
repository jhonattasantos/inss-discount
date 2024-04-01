FROM ruby:3.2.1-alpine
ENV LANG C.UTF-8

RUN apk update
RUN apk add nodejs
RUN apk add libpq
RUN apk add --virtual build-dependencies build-base gcc wget git tzdata
RUN apk add postgresql-client postgresql-dev ffmpeg
RUN mkdir /inss_discount
WORKDIR /inss_discount
COPY Gemfile /inss_discount/Gemfile
COPY Gemfile.lock /inss_discount/Gemfile.lock
RUN bundle install
COPY . /inss_discount

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["/usr/bin/entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
