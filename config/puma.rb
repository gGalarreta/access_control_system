workers Integer(ENV['WEB_CONCURRENCY'] || 2)
threads_count = Integer(ENV['RAILS_MAX_THREADS'] || 5)
threads threads_count, threads_count

preload_app!

rackup      DefaultRackup
port        ENV['PORT']     || 3000
environment ENV['RACK_ENV'] || 'development'

on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    config = ActiveRecord::Base.configurations[Rails.env] ||
                Rails.application.config.database_configuration[Rails.env]
    config['pool'] = ENV['RAILS_MAX_THREADS'] || 5
    ActiveRecord::Base.establish_connection(config)
  end

end

if ENV["RACK_ENV"] == "production"
  workers ENV.fetch("WEB_CONCURRENCY") { 3 }
  preload_app!
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
  before_fork do
    ActiveRecord::Base.connection_pool.disconnect!
  end
end