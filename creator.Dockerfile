FROM ruby:3.0.3
LABEL author="jerryc.nguyen91@gmail.com"

# Setup environment variables that will be available to the instance
ENV APP_HOME /app
ENV RAILS_ENV development
ENV RACK_ENV development

# Create a directory for our application
# and set it as the working directory
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY creator.Gemfile Gemfile

# Bundle Gems for development environment
RUN bundle install

# Copy over our application code
COPY . $APP_HOME
