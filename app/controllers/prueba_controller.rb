class PruebaController < ApplicationController
  def index
    redis = Redis.new(host: 'redis', port: 6379)
    @numero = redis.get("numero")
  end
end
