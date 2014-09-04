# == Schema Information
#
# Table name: users
#
#  id                    :integer          not null, primary key
#  first_name            :string(255)
#  last_name             :string(255)
#  username              :string(255)
#  email                 :string(255)
#  password_digest       :string(255)
#  avatar                :text
#  location              :string(255)
#  score                 :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#  is_admin              :boolean          default(FALSE)
#  is_pub                :boolean          default(FALSE)
#  is_pub_verified       :boolean          default(FALSE)
#  sign_in_token         :string(255)
#  registration_complete :boolean
#  password_reset        :string(255)
#

class User < ActiveRecord::Base
  # attr_accessible :name, :email, :password, :password_confirmation, :sign_in_token, :registration_complete, :reset_password

  #This generates sign_in_token
  def generate_sign_in_token
    self.sign_in_token = Digest::SHA1.hexdigest([Time.now, rand].join)
  end

  has_secure_password
  mount_uploader :avatar, AvatarUploader
  has_many :followers, :dependent => :destroy
  has_many :friends, :through => :followers
  has_many :pub_challenges
  has_many :achievements
  validates :username, :email, :uniqueness => true, :presence => true
  validates :username, :length => { in: 3..20 }
  validates :password, :length => { in: 6..20 }
end
