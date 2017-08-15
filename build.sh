# docker build -t chyld/demo2 --build-arg OPTIONS="--without development test" .
docker build -t chyld/demo3 .

# docker run --rm -it -e "RAILS_ENV=development" 31 rspec
