FROM ruby:3.4.6-alpine
COPY remove_before_launch.rb /remove_before_launch.rb
COPY /lib /lib
ENTRYPOINT ["ruby", "/remove_before_launch.rb"]
