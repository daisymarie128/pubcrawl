User.destroy_all
PubChallenge.destroy_all
Pub.destroy_all

u1 = User.create(:first_name => 'u1', :last_name => 'u1last', :username => 'u1', :avatar => 'http://placekitten.com/500/500', :email => 'user@gmail.com', :location => 'Sydney', :password => 'p', :password_confirmation => 'p', :score => '100')

p1 = Pub.create(:name => 'pubname', :address => 'adress', :description => 'description', :image => 'http://placekitten.com/500/500', :email => 'pub@gmail.com', :password => 'p', :password_confirmation => 'p')

c1 = PubChallenge.create(:name => 'challeneg name', :image => 'image', :description => 'description', :badge => 'badge', :point_value => "20")

t1 = Task.create(:task => 'task name')
t2 = Task.create(:task => 'task two')

p1.pub_challenges << c1

c1.tasks << t1
c1.tasks << t2