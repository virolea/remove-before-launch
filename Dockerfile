FROM ruby:3.4.6-alpine
COPY remove_before_flight.rb /remove_before_flight.rb
ENTRYPOINT ["ruby", "/remove_before_flight.rb"]
