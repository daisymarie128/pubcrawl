# == Schema Information
#
# Table name: pubs
#
#  id                    :integer          not null, primary key
#  name                  :string(255)
#  address               :string(255)
#  description           :text
#  email                 :string(255)
#  password_digest       :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#  username              :string(255)
#  image                 :string(255)
#  sign_in_token         :string(255)
#  password_reset        :string(255)
#  registration_complete :boolean          default(FALSE)
#

require 'rails_helper'

RSpec.describe Pub, :type => :model do
  describe 'A pub' do
    context 'with valid input' do
      before do
        @pub = Pub.create(:username => 'pub1', :name => 'Pub Name', :email => 'pub@email.com', :password => 'password', :password_confirmation => 'password', :registration_complete => 'false')
      end

      it "should exist" do
        expect(@pub).to be
      end

      it "should have a username" do
        expect(@pub.username).to eq('pub1')
      end

      it "should have a name" do
        expect(@pub.name).to eq('Pub Name')
      end

      it "should have an email" do
        expect(@pub.email).to eq('pub@email.com')
      end

      it "should have an valid password" do
        expect(@pub.password).to eq('password')
        expect(@pub.password_confirmation).to eq('password')
      end

      it "should not be approved" do
        expect(@pub.registration_complete).to eq(false)
      end

      it 'should generate a token to sign in' do
        token = @pub.generate_sign_in_token
        expect(@pub.sign_in_token).to eq(token)
      end

      context 'with invalid input' do
        before do
          @pub = Pub.create(:username => 'i', :email => '')
        end

        it "should not have an id" do
          expect(@pub.id).to_not be
        end
      end

    end

  end
end
