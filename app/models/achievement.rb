# == Schema Information
#
# Table name: achievements
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  pub_challenge_id :integer
#

class Achievement < ActiveRecord::Base
  belongs_to :user
  belongs_to :pub_challenges
end
