User.destroy_all
PubChallenge.destroy_all
Pub.destroy_all

u1 = User.create(:first_name => 'u1', :last_name => 'u1last', :username => 'u1', :avatar => 'http://placekitten.com/500/500', :email => 'user@gmail.com', :location => 'Sydney', :password => 'p', :password_confirmation => 'p', :score => '100')
u2 = User.create(:first_name => 'u2', :last_name => 'u2last', :username => 'u2', :avatar => 'http://placekitten.com/500/500', :email => 'user@gmail.com', :location => 'Sydney', :password => 'p', :password_confirmation => 'p', :score => '200')
u3 = User.create(:first_name => 'u3', :last_name => 'u3last', :username => 'u3', :avatar => 'http://placekitten.com/500/500', :email => 'user@gmail.com', :location => 'Sydney', :password => 'p', :password_confirmation => 'p', :score => '300')
u4 = User.create(:first_name => 'u4', :last_name => 'u4last', :username => 'u4', :avatar => 'http://placekitten.com/500/500', :email => 'user@gmail.com', :location => 'Sydney', :password => 'p', :password_confirmation => 'p', :score => '400')
u5 = User.create(:first_name => 'u5', :last_name => 'u5last', :username => 'u5', :avatar => 'http://placekitten.com/500/500', :email => 'user@gmail.com', :location => 'Sydney', :password => 'p', :password_confirmation => 'p', :score => '500')



p1 = Pub.create(:username => 'pjs', :name => "P.J O'Briens", :address => '57 King St, Sydney NSW 2000', :description => 'description', :image => 'http://placekitten.com/500/500', :email => 'pub@gmail.com', :password => 'p', :password_confirmation => 'p')
p2 = Pub.create(:username => 'elloco', :name => 'El Loco at Slip Inn', :address => '111 Sussex St, Sydney NSW 2000', :description => 'description', :image => 'http://placekitten.com/500/500', :email => 'pub2@gmail.com', :password => 'p', :password_confirmation => 'p')
p3 = Pub.create(:username => 'nelson', :name => "The Lord Nelson Brewery Hotel", :address => '19 Kent St
The Rocks NSW 2000', :description => 'description', :image => 'http://placekitten.com/500/500', :email => 'pub3@gmail.com', :password => 'p', :password_confirmation => 'p')

c1 = PubChallenge.create(:name => 'challeneg name', :image => 'image', :description => 'description', :badge => 'badge', :point_value => "20")
c2 = PubChallenge.create(:name => 'challeneg for a different pub', :image => 'image', :description => 'description', :badge => 'badge', :point_value => "20")

t1 = Task.create(:task => 'task name')
t2 = Task.create(:task => 'task two')
t3 = Task.create(:task => 'task three')
t4 = Task.create(:task => 'task four')

# a1 = Achievement.create(:pub_challenge_id => 2)

p1.pub_challenges << c1
p2.pub_challenges << c2

c1.tasks << t1
c1.tasks << t2

c2.tasks << t3
c2.tasks << t4


