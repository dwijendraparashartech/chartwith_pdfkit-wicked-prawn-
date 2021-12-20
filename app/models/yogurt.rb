class Yogurt < ApplicationRecord
  	has_one_attached :avatar
 	attr_accessor :avatar
    mount_uploader :avatar, AvatarUploader
end
