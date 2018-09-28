workers Integer(ENV['WEB_CONCURRENCY'] || 2)
threads_count = Integer(ENV['RAILS_MAX_THREADS'] || 5)
threads threads_count, threads_count

preload_app!

rackup      DefaultRackup
port        ENV['PORT']     || 3000
environment ENV['RACK_ENV'] || 'development'

on_worker_boot do
  # worker specific setup
  #ActiveSupport.on_load(:active_record) do
  #  config = ActiveRecord::Base.configurations[Rails.env] ||
  #              Rails.application.config.database_configuration[Rails.env]
  #  config['pool'] = ENV['RAILS_MAX_THREADS'] || 5
  #  ActiveRecord::Base.establish_connection(config)
  #end
  ActiveRecord::Base.connection_pool.disconnect!
  
  ActiveSupport.on_load(:active_record) do
    if Rails.application.config.database_configuration
      config = Rails.application.config.database_configuration[Rails.env]
      config['reaping_frequency'] = ENV['DB_REAP_FREQ'] || 10 # seconds
      config['pool']              = ENV['DB_POOL']      || 5
      ActiveRecord::Base.establish_connection(config)
    end
  end
end