# == Schema Information
#
# Table name: followers
#
#  id        :integer          not null, primary key
#  user_id   :integer
#  friend_id :integer
#

class Follower < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => "User"
end
