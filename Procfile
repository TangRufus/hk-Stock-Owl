web:      bundle exec unicorn -p $PORT -c ./config/unicorn.rb
resque-scheduler:   env TERM_CHILD=1 RESQUE_TERM_TIMEOUT=9 QUEUE='*' bundle exec rake resque:scheduler
