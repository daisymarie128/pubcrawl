# == Schema Information
#
# Table name: pubs
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  address     :string(255)
#  image       :text
#  description :text
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Pub < ActiveRecord::Base
  belongs_to :user
  has_many :pub_challenges
end
