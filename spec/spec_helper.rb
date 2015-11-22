# Require this file for unit tests
ENV['LOTUS_ENV'] ||= 'test'

require_relative '../config/environment'
require 'minitest/autorun'
# ostruct use to create fake object in ruby it like double in rspec
require 'ostruct'
require 'byebug'

Lotus::Application.preload!
