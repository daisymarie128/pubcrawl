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

class PubChallenges < ActiveRecord::Base
  belongs_to :pub
end
