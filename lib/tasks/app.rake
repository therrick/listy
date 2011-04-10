namespace :app do

  task :ensure_development_environment => :environment do
    if Rails.env.production?
      raise "\nI'm sorry, Dave, I'm afraid I can't do that.\n(You're asking me to drop your production database.)"
    end
  end

  desc "Reset"
  task :reset => [:ensure_development_environment, "db:drop", "db:create", "db:migrate", "db:seed", "populate_sample_data"]

  desc "Populate the database with sample data."
  task :populate_sample_data => :environment do


    # find_or_create won't work with the user model and 'password'
    [
      {:email => 'admin@test.com', :password => 'password1', :is_admin => true}
    ].each do |attributes|
      if !User.find_by_email(attributes[:email])
        u = User.new
#        u.username = attributes[:username]
        u.email    = attributes[:email]
        u.password = attributes[:password]
        u.is_admin = attributes[:is_admin]
        u.save!
      end
    end
    
    user1 = User.find_by_email('tom_herrick@hotmail.com')

    [
      {:name => "giant", :user_id => user1.id},
    ].each do |attributes|
      Store.find_or_create_by_name_and_user_id(attributes)
    end

    store1 = Store.find_by_name_and_user_id("giant", user1.id)
    [
      {:name => "1A", :store_id => store1.id},
      {:name => "1B", :store_id => store1.id},
      {:name => "2", :store_id => store1.id},
      {:name => "3", :store_id => store1.id},
    ].each do |attributes|
      Location.find_or_create_by_name_and_store_id(attributes)
    end

    [
      {:name => "milk", :store_id => store1.id},
      {:name => "eggs", :store_id => store1.id},
    ].each do |attributes|
      Item.find_or_create_by_name_and_store_id(attributes)
    end
  end
end