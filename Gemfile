source "https://rubygems.org"

ruby "3.2.2" # (Afegit si tens una versió concreta de Ruby. Canvia-la si cal.)

# --- Rails i base ---
gem "rails", "~> 8.0.2"
gem "puma", ">= 5.0"
gem "sqlite3", ">= 2.1"
gem "bootsnap", require: false

# --- Async backends (Rails 8) ---
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

# --- Optimitzacions ---
gem "thruster", require: false
gem "kamal", require: false

# --- API / GraphQL ---
gem "graphql", "~> 2.5"
gem "rack-cors"
gem "graphiql-rails", group: :development

# --- Compatibilitat amb Windows ---
gem "tzinfo-data", platforms: %i[windows jruby]

# --- Desenvolupament i Test ---
group :development, :test do
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
  gem "rspec-rails", "~> 8.0"
  gem "factory_bot_rails"
  gem "faker"
  gem 'shoulda-matchers', '~> 6.0'
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end

