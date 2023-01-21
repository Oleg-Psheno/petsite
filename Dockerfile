# Use an official Ruby runtime as the base image
FROM ruby:3.2.0

# Set the working directory
WORKDIR /usr/src/app

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Copy the Gemfile and Gemfile.lock
COPY Gemfile* ./

# Install gems
RUN bundle install

RUN rails db:create db:migrate

# Copy the rest of the application code
COPY . .

