# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string(255)
#  last_name       :string(255)
#  username        :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  avatar          :text
#  location        :string(255)
#  score           :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  is_admin        :boolean
#

require 'rails_helper'

RSpec.describe User, :type => :model do
  describe 'A User' do
    before do
      @user = User.create(:name => 'User1')
    end

  #   it "should not be squishy" do
  #     expect(@apple.squishy?).to eq(false)
  #   end

  #   it 'should remember what class it is using Single Table Inheritance (STI)' do
  #     apple = Fruit.find(@apple.id)
  #     expect(apple.class).to eq(Apple)
  #     expect(apple).to eq(@apple)
  #     expect(apple.is_a?(Fruit)).to eq(true)
  #     expect(apple.class.ancestors).to include(Fruit)
  #   end
  # end

  # describe "A pear" do
  #   before do
  #     @pear = Pear.create(:name => 'Prickly')
  #   end

  #   it "should be kinda squishy" do
  #     expect(@pear.squishy?).to eq(true)
  #   end

  #   it 'should remember what class it is using Single Table Inheritance (STI)' do
  #     pear = Fruit.find(@pear.id)
  #     expect(pear.class).to eq(Pear)
  #     expect(pear).to eq(@pear)
  #     expect(pear.is_a?(Fruit)).to eq(true)
  #     expect(pear.class.ancestors).to include(Fruit)
  #   end
  end
end

