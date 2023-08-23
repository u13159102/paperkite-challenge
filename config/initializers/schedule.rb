# ==== ActiveJob Schedules

Sidekiq.configure_server do |config|
  config.on(:startup) do
      Sidekiq.set_schedule('UpdateVendorJob', { every: '1m', class: 'UpdateVendorJob' })
  end
end