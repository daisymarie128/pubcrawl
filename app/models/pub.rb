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
  validates :username, :email, :uniqueness => true, :presence => true
  # has_many :followers, :dependent => :destroy
  # validates :username, :length => { in: 3..20 }
  # validates :password, :length => { in: 6..20 }
end
