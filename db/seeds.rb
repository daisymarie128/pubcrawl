User.destroy_all
PubChallenge.destroy_all
Pub.destroy_all

u1 = User.create(:first_name => 'u1', :last_name => 'u1last', :username => 'u1', :avatar => 'http://placekitten.com/500/500', :email => 'user@gmail.com', :location => 'Sydney', :password => 'p', :password_confirmation => 'p', :score => '100')

p1 = Pub.create(:name => 'pubname', :address => 'adress', :description => 'description', :image => 'http://placekitten.com/500/500', :email => 'pub@gmail.com', :password => 'p', :password_confirmation => 'p')
p2 = Pub.create(:name => 'pubname2', :address => 'adress2', :description => 'description', :image => 'http://placekitten.com/500/500', :email => 'pub2@gmail.com', :password => 'p', :password_confirmation => 'p')

c1 = PubChallenge.create(:name => 'challeneg name', :image => 'image', :description => 'description', :badge => 'badge', :point_value => "20")
c2 = PubChallenge.create(:name => 'challeneg for a different pub', :image => 'image', :description => 'description', :badge => 'badge', :point_value => "20")

t1 = Task.create(:task => 'task name')
t2 = Task.create(:task => 'task two')
t3 = Task.create(:task => 'task three')
t4 = Task.create(:task => 'task four')

p1.pub_challenges << c1
p2.pub_challenges << c2

c1.tasks << t1
c1.tasks << t2

c2.tasks << t3
c2.tasks << t4