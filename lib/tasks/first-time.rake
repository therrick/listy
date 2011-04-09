# based on technicalpickles 'wheres-your-database-yml-dude' plugin, minus the silly dude-speak

file "config/database.yml.example" do |task|
  abort "#{task.name} missing"
end

file "config/database.yml" => "config/database.yml.example" do |task|
  puts "found #{task.prerequisites.first}, copying..."
  cp task.prerequisites.first, task.name
  abort "First time setup of database.yml complete.  Edit as necessary for your environment, then rerun the last command."
end

task :environment => "config/database.yml"
