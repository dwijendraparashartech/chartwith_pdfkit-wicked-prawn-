# config/initializers/imgkit.rb
IMGKit.configure do |config|
  # config.wkhtmltoimage = '/usr/share/rvm/gems/ruby-2.6.7/bin/wkhtmltoimage'
  config.wkhtmltoimage = '/path/to/wkhtmltoimage'
end