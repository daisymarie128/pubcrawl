# == Schema Information
#
# Table name: personal_challenges
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  address     :string(255)
#  image       :text
#  description :text
#  user_id     :integer
#

class PersonalChallenge < ActiveRecord::Base
  belongs_to :user
end
