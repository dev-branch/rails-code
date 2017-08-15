FROM ruby:2.4.1

RUN gem install rails

RUN cd /usr/local                                                        \
    && wget https://nodejs.org/dist/v8.3.0/node-v8.3.0-linux-x64.tar.xz  \
    && tar -xvf node-v8.3.0-linux-x64.tar.xz                             \
    && mv node-v8.3.0-linux-x64 node                                     \
    && rm node-v8.3.0-linux-x64.tar.xz

ENV PATH "/usr/local/node/bin:$PATH"
ENV PORT "3333"
ENV HOST "0.0.0.0"
ENV RAILS_ENV "production"
ENV RAILS_SERVE_STATIC_FILES "true"
ENV SECRET_KEY_BASE "44efda518ab1dd8b23b21447697a5f01dee829bf0863b32f1c13cef3905f82b79b4a33796a3a51a5ec9609bd4e05f6899c053a21c6640469262acbdf9c965102"

RUN npm i -g yarn
COPY . /usr/src/app
WORKDIR /usr/src/app
RUN bundle install
RUN rails assets:clobber && rails assets:precompile

EXPOSE 3333
CMD ["rails", "server"]
