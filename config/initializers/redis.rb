require 'resque'
require 'resque-scheduler'
require 'resque/scheduler/server'

uri = URI.parse(ENV["REDIS_URL"] || 'redis://localhost:6379/')
REDIS = Redis.new(:url => uri)
