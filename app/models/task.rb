# == Schema Information
#
# Table name: tasks
#
#  id   :integer          not null, primary key
#  task :string(255)
#

class Task < ActiveRecord::Base
  belongs_to :pub_challenge
end
