FROM ruby:3.0.3
LABEL author="jerryc.nguyen91@gmail.com"

# Setup environment variables that will be available to the instance
ENV APP_HOME /app
ENV RAILS_ENV development
ENV RACK_ENV development

# Installation of dependencies
RUN apt-get update -qq && apt-get install -y git-core build-essential libpq-dev nodejs imagemagick libmagickcore-dev libmagickwand-dev && apt-get clean autoclean && rm -rf /var/lib/apt /var/lib/dpkg /var/lib/cache /var/lib/log


# Create a directory for our application
# and set it as the working directory
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# Copy Gemfile
# Adding gems
COPY Gemfile Gemfile

# Bundle Gems for development environment
RUN gem install bundler
RUN gem install libv8-node   
RUN bundle install --jobs 20 --retry 5

# Copy over our application code
COPY . $APP_HOME

# Create sidekiq PIDS
RUN rm -rf tmp
RUN mkdir tmp && cd tmp && mkdir pids && cd pids && touch sidekiq.pid

EXPOSE 3000

# Run our app
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb", "config.ru"]
