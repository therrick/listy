# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

[
  { :email => 'admin@test.com', :password => 'password1', :admin => true }
].each do |attributes|
  if !User.find_by_username(attributes[:email])
    u = User.new
    u.email    = attributes[:email]
    u.password = attributes[:password]
    u.admin = attributes[:admin]
    u.save!
  end
end


