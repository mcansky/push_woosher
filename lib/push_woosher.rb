require 'rubygems'
require 'virtus'
require 'json'
require 'bundler'
require 'securerandom'
require 'active_support/inflector'

Bundler.setup(:default)

require 'push_woosher/version'
require 'push_woosher/base'
require 'push_woosher/config'
require 'push_woosher/push'
require 'push_woosher/device/base'
require 'push_woosher/device/android'
require 'push_woosher/device/ios'

module PushWoosher
  # Your code goes here...
end
