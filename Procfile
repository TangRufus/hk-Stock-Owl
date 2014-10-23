web: bundle exec rails server -p $PORT
resque: env TERM_CHILD=1 RESQUE_TERM_TIMEOUT=9 QUEUE='*' bundle exec rake resque:work
