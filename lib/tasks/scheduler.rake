desc "This reseeds the database with all new games"
task :update_games => :environment do
  puts "Updating database.."
  # rake db:schema:load DISABLE_DATABASE_ENVIRONMENT_CHECK=1 && rake db:seed
  Rake::Task["db:seed"].invoke
  puts "done."
end