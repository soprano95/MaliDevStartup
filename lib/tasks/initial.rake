# encoding: utf-8

namespace :initial do

  desc "Fill database with sample data"
  task init: :environment do
    Rake::Task['db:drop'].invoke
    puts "===> db drop!"
    Rake::Task['db:create'].invoke
    puts "===> db create!"
    Rake::Task['db:migrate'].invoke
    puts "===> db migrate!"
    #with_config do |app, host, db, user, pass|
     # sh "PGPASSWORD=#{pass} psql -U #{user} -d template1 -c \"ALTER DATABASE #{db} SET datestyle TO 'ISO, european';\""
      #puts "===> db Datestyle!"
    #end
  end

  def with_config
    yield Rails.application.class.parent_name.underscore,
        ActiveRecord::Base.connection_config[:host],
        ActiveRecord::Base.connection_config[:database],
        ActiveRecord::Base.connection_config[:username],
        ActiveRecord::Base.connection_config[:password]
  end

end