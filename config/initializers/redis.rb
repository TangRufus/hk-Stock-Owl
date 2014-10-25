require 'resque'
require 'resque-scheduler'
require 'resque/scheduler/server'

if Rails.application.secrets.rediscloud_url
    uri = URI.parse(Rails.application.secrets.rediscloud_url)
    Resque.redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
end
