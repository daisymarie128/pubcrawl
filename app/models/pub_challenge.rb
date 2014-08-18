# == Schema Information
#
# Table name: pub_challenges
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  image       :string(255)
#  description :string(255)
#  badge       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class PubChallenge < ActiveRecord::Base
  # mount_uploader :image, ImageUploader
  # belongs_to :pub
end
