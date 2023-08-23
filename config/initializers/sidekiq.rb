require 'sidekiq'
require 'sidekiq-status'

Sidekiq.configure_client do |config|
  Sidekiq::Status.configure_client_middleware config, expiration: 30.minutes.to_i
end

Sidekiq.configure_server do |config|
  Sidekiq.schedule = {}

  config.logger.level = Rails.logger.level
  Rails.logger = ActiveRecord::Base.logger = Sidekiq.logger

  Sidekiq::Status.configure_server_middleware config, expiration: 30.minutes.to_i
  Sidekiq::Status.configure_client_middleware config, expiration: 30.minutes.to_i
end

