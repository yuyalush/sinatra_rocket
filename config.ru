require 'rubygems'
require 'bundler/setup'
Bundler.require
require 'sinatra'
require 'slim'

#if development?
#  $stdout.sync = true
  require 'sinatra/reloader'
#end
require 'sinatra/rocketio'

require File.dirname(__FILE__)+'/main'

set :websocketio, :port => 8080
set :cometio, :timeout => 120
set :rocketio, :websocket => true, :comet => true

run Sinatra::Application
