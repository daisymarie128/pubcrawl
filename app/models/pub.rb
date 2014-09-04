# == Schema Information
#
# Table name: pubs
#
#  id                    :integer          not null, primary key
#  name                  :string(255)
#  address               :string(255)
#  description           :text
#  email                 :string(255)
#  password_digest       :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#  username              :string(255)
#  image                 :string(255)
#  sign_in_token         :string(255)
#  password_reset        :string(255)
#  registration_complete :boolean          default(FALSE)
#

class Pub < ActiveRecord::Base

  def generate_sign_in_token
    self.sign_in_token = Digest::SHA1.hexdigest([Time.now, rand].join)
  end

  has_secure_password
  mount_uploader :image, ImageUploader
  has_many :pub_challenges
  validates :username, :email, :uniqueness => true, :presence => true
  # has_many :followers, :dependent => :destroy
  validates :username, :length => { in: 3..20 }
  validates :password, :length => { in: 6..20 }
end
