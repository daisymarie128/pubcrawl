# == Schema Information
#
# Table name: tasks
#
#  id               :integer          not null, primary key
#  task             :string(255)
#  pub_challenge_id :integer
#

class Task < ActiveRecord::Base
  belongs_to :pub_challenge
end
