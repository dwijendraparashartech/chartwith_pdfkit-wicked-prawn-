 PDFKit.configure do |config|
  config.wkhtmltopdf = '/usr/share/rvm/gems/ruby-2.6.7/bin/wkhtmltopdf'
  config.default_options = {
    :page_size => 'Legal',
    :print_media_type => true
  }
  # Use only if your external hostname is unavailable on the server.
  config.root_url = "http://localhost:3000"
  config.verbose = false
 end