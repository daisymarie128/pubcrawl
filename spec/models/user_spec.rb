# == Schema Information
#
# Table name: users
#
#  id                    :integer          not null, primary key
#  first_name            :string(255)
#  last_name             :string(255)
#  username              :string(255)
#  email                 :string(255)
#  password_digest       :string(255)
#  avatar                :text
#  location              :string(255)
#  score                 :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#  is_admin              :boolean          default(FALSE)
#  is_pub                :boolean          default(FALSE)
#  is_pub_verified       :boolean          default(FALSE)
#  sign_in_token         :string(255)
#  registration_complete :boolean
#  password_reset        :string(255)
#

require 'rails_helper'

RSpec.describe User, :type => :model do
  describe 'A User' do

    context 'with valid input' do
      before do
        @user = User.create(:username => 'user1', :email => 'hello@email.com', :password => 'password', :password_confirmation => 'password')
      end

      it "should exist" do
        expect(@user).to be
      end

      it "should have a username" do
        expect(@user.username).to eq('user1')
      end

      it "should have an email" do
        expect(@user.email).to eq('hello@email.com')
      end

      it "should have an valid password" do
        expect(@user.password).to eq('password')
        expect(@user.password_confirmation).to eq('password')
      end

      it "should not be approved" do
        expect(@user.registration_complete).to eq(false)
      end

      it 'should generate a token to sign in' do
        token = @user.generate_sign_in_token
        expect(@user.sign_in_token).to eq(token)
      end
    end

    context 'with invalid input' do
      before do
        @user = User.create(:username => 'i', :email => '')
      end

      it "should not have an id" do
        expect(@user.id).to_not be
      end
    end
  end


end

