# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string(255)
#  last_name       :string(255)
#  username        :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  avatar          :text
#  location        :string(255)
#  score           :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  is_admin        :boolean          default(FALSE)
#  is_pub          :boolean          default(FALSE)
#  is_pub_verified :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  has_secure_password
  # mount_uploader :image, ImageUploader
  has_many :followers, :dependent => :destroy
  has_many :friends, :through => :followers
  has_many :badges, :through => :pub_challenges
  has_many :achievements
end
