ImageKitIo.configure do |config|
  if Rails.env.development?
    config.public_key = 'your_public_api_key'
    config.private_key = 'your_private_api_key'
    config.url_endpoint = 'https://ik.imagekit.io/your_imagekit_id/'
  end
  config.service = :carrierwave
  #config.service = :active_storage
  #config.constants.MISSING_PRIVATE_KEY = 'custom error message'
end