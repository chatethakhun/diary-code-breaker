Redis.current = Redis.new(:host => ( ENV["REDIS_URL"] ),
                          :port => ( ENV["REDIS_PORT"] ).to_i,
                          :password => ( ENV["REDIS_PASSWORD"] ))