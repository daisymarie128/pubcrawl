require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  describe 'Users controller' do
    describe '#create' do
      before do
        post :create, pub: { username: 'user2', :email => 'hello@gmail' , :password => 'password', :password_confirmation => 'password' }
      end

      it 'should render json' do
        expect(response).to be
      end

    end
  end
end
