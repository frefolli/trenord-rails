namespace :clean do
  task all: :environment do |task_name|
    puts "Rake::Start #{task_name}"
    ActiveRecord::Base.transaction do
      StopTime.delete_all
      Trip.delete_all
      Stop.delete_all
      CalendarDate.delete_all
      Calendar.delete_all
      Route.delete_all
      Agency.delete_all
    end
    puts "Rake::End #{task_name}"
  end
end
