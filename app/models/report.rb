class Report < ActiveRecord::Base
  mount_uploader :forest_photo, ForestPhotoUploader
end
