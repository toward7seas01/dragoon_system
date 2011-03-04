require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end


Dir["#{File.dirname(__FILE__)}/**/**/*.rb"].each do |file|
  unless file == __FILE__
    require file
  end
end




