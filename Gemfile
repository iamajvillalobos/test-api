source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'pg', '0.18.4'
gem 'puma', '3.7'
gem 'rails', '5.1.0'

group :development, :test do
  gem 'pry', '0.10.4'
  gem 'rspec-rails', '3.5'
end

group :test do
  gem 'factory_girl_rails', '4.8.0'
  gem 'faker', '1.7.3'
  gem 'database_cleaner', '1.6.1'
end