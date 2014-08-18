User.destroy_all
PubChallenge.destroy_all
Pub.destroy_all

u1 = User.create(:frist_name => 'u1', :last_name => 'u1last', :username => 'u1', :avatar => 'http://placekitten.com/500/500', :email => 'user@gmail.com', :location => 'Sydney', :password => 'p', :password_confirmation => 'p', :score => '100')
