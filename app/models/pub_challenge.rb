# == Schema Information
#
# Table name: pub_challenges
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  image       :string(255)
#  description :string(255)
#  badge       :string(255)
#  point_value :string(255)
#  pub_id      :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class PubChallenge < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  mount_uploader :badge, BadgeUploader
  belongs_to :pub
  has_many :tasks
  # validates :name, :image, :description, :badge, :point_value, :presence => true
end