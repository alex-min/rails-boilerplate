FROM ruby:2.3.1

RUN env
RUN mkdir -p /app
RUN apt-get update
RUN apt-get install wget nodejs -y
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN wget http://binaries.html-tidy.org/binaries/tidy-5.2.0/tidy-5.2.0-64bit.deb -O /tmp/tidy.deb
RUN dpkg -i /tmp/tidy.deb
WORKDIR /app
COPY Gemfile Gemfile.lock ./
ENV BUNDLE_PATH /bundle
RUN bundle install --jobs 20 --retry 5
EXPOSE 5001
ADD . /app
CMD ["bundle", "exec", "thin", "start", "-p", "5001"]
