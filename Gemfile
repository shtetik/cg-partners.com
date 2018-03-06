source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.5.0'

gem 'rails', '~> 5.1.5'

# Backend
gem 'jbuilder', '~> 2.5'
gem 'pg', '~> 1.0'
gem 'puma', '~> 3.11', '>= 3.11.2'

# View helper to manage "active" state of a link
gem 'active_link_to', '~> 1.0', '>= 1.0.5'

# File attachment management
gem 'paperclip', '~> 5.2', '>= 5.2.1'

# Pretty URLs
gem 'friendly_id', '~> 5.2', '>= 5.2.3'
gem 'friendly_id-globalize', '~> 1.0.0.alpha3'

# ActiveRecord model/data translation
gem 'globalize', '~> 5.1'
gem 'globalize-accessors', '~> 0.2.1'
gem 'globalize-validations', '~> 0.0.4'

# Admin framework
gem 'trestle', '~> 0.8.7'
gem 'trestle-auth', '~> 0.2.3'
gem 'trestle-tinymce', '~> 0.1.1'

# Frontend
gem 'slim-rails', '~> 3.1', '>= 3.1.3'
gem 'coffee-rails', '~> 4.2'
gem 'sass-rails', '~> 5.0', '>= 5.0.7'
gem 'turbolinks', '~> 5.1'
gem 'uglifier', '~> 4.1', '>= 4.1.6'
gem 'autoprefixer-rails', '~> 8.1'

group :development, :test do
  gem 'byebug', '~> 10.0', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '~> 3.1', '>= 3.1.5'
  gem 'spring', '~> 2.0', '>= 2.0.2'
  gem 'spring-watcher-listen', '~> 2.0', '>= 2.0.1'
  gem 'web-console', '~> 3.5', '>= 3.5.1'
  gem 'better_errors', '~> 2.4'
  gem 'binding_of_caller', '~> 0.8.0'

  # Deploy tools
  gem 'capistrano', '~> 3.10', '>= 3.10.1'
  gem 'capistrano-bundler', '~> 1.3'
  gem 'capistrano-faster-assets', '~> 1.1'
  gem 'capistrano-passenger', '~> 0.2.0'
  gem 'capistrano-rails', '~> 1.3', '>= 1.3.1'
  gem 'capistrano-rvm', '~> 0.1.2'
end

gem 'tzinfo-data', '~> 1.2018', '>= 1.2018.3', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
