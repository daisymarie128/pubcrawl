# == Schema Information
#
# Table name: pubs
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  address         :string(255)
#  image           :text
#  description     :text
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class Pub < ActiveRecord::Base
  has_secure_password
  mount_uploader :image, ImageUploader
  has_many :pub_challenges
end
