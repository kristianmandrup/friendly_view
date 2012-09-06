worker: QUEUE=* bundle exec rake environment resque:work
scheduler: bundle exec rake resque:scheduler
web: bundle exec rails server thin -p $PORT -e $RACK_ENV