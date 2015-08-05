ENV['RAILS_ENV'] = ENV['RAKE_ENV'] = 'test'

unless defined?(RUBY_ENGINE) && %w(rbx jruby).include?(RUBY_ENGINE)
  require 'simplecov'
end

$: << File.expand_path('../lib', __FILE__)

require 'i18n/tasks'
require 'rake'

require 'term/ansicolor'
Term::ANSIColor::coloring = false

Dir['spec/support/**/*.rb'].each { |f| require "./#{f}" }

RSpec.configure do |config|
  config.expose_dsl_globally = false
  config.include FixturesSupport
  config.include CaptureStd
  config.include Trees
  config.include KeysAndOccurrences
end
