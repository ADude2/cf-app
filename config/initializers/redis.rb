if ENV['RAILS_ENV'] == 'production'
  $redis_cache = Redis.new
else
  $redis_cache = Redis.new
end