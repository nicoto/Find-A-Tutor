#.rails_template.rb




# setup for puma and heroku production
environment 'config.force_ssl=true', env: 'production'
gem "puma"
gem 'rails_12factor'

# setup puma config
file 'config/puma.rb', <<-CODE
  workers Integer(ENV['WEB_CONCURRENCY'] || 2)
  threads_count = Integer(ENV['MAX_THREADS'] || 5)
  threads threads_count, threads_count

  preload_app!

  rackup      DefaultRackup
  port        ENV['PORT']     || 3000
  environment ENV['RACK_ENV'] || 'development'

  on_worker_boot do
    # Worker specific setup for Rails 4.1+
    # See: https://devcenter.heroku.com/articles/
    # deploying-rails-applications-with-the-puma-web-server#on-worker-boot
    ActiveRecord::Base.establish_connection
  end
CODE

# add Heroku Procfile for puma
file './Procfile', <<-CODE
  web: bundle exec puma -C config/puma.rb
CODE




# setup for development
gem_group :development do
  gem 'faker'
  gem 'annotate'
  gem 'bullet'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry-rails'
  gem 'quiet_assets'
end

rake("db:create")
