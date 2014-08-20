# == Schema Information
#
# Table name: achievments
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  pub_challenge_id :integer
#

class Achievment < ActiveRecord::Base
  belongs_to :user
  has_many :pub_challenges
end
