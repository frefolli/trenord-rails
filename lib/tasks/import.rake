namespace :import do
  AGENCIES_CSV = "import_files/trenord/agency.csv"
  ROUTES_CSV = "import_files/trenord/routes.csv"
  CALENDARS_CSV = "import_files/trenord/calendar.csv"
  CALENDAR_DATES_CSV = "import_files/trenord/calendar_dates.csv"
  TRIPS_CSV = "import_files/trenord/trips.csv"
  STOPS_CSV = "import_files/trenord/stops.csv"
  STOP_TIMES_CSV = "import_files/trenord/stop_times.csv"

  task all: :environment do |task_name|
    Rake::Task["import:agencies"].invoke
    Rake::Task["import:routes"].invoke
    Rake::Task["import:calendars"].invoke
    Rake::Task["import:calendar_dates"].invoke
    Rake::Task["import:stops"].invoke
    Rake::Task["import:trips"].invoke
    Rake::Task["import:stop_times"].invoke
  end

  task agencies: :environment do |task_name|
    puts "Rake::Start #{task_name}"
    file = CsvBl::ReadFile.run!(path: AGENCIES_CSV)
    agencies = []
    file[:rows].each do |row|
      agency = Agency.new
      agency.name = row[1]
      agency.url = row[2]
      agency.timezone = row[3]
      agency.lang = row[4]
      agency.phone = row[5]
      agencies << agency
    end
    Agency.import agencies
    puts "Rake::Info imported #{agencies.length} Agencies"
    puts "Rake::End #{task_name}"
  end

  task routes: :environment do |task_name|
    puts "Rake::Start #{task_name}"
    file = CsvBl::ReadFile.run!(path: ROUTES_CSV)
    routes = []
    file[:rows].each do |row|
      route = Route.new
      route.agency_id = Agency.find_by(name: row[1]).id
      route.short_name = row[2]
      route.long_name = row[3]
      route.desc = row[4]
      route.route_type = row[5]
      route.url = row[6]
      route.color = row[7]
      route.text_color = row[8]
      routes << route
    end
    Route.import routes
    puts "Rake::Info imported #{routes.length} Routes"
    puts "Rake::End #{task_name}"
  end

  task calendars: :environment do |task_name|
    puts "Rake::Start #{task_name}"
    file = CsvBl::ReadFile.run!(path: CALENDARS_CSV)
    calendars = []
    file[:rows].each do |row|
      calendar = Calendar.new
      calendar.id = row[0]
      calendar.monday = row[1]
      calendar.tuesday = row[2]
      calendar.wednesday = row[3]
      calendar.thursday = row[4]
      calendar.friday = row[5]
      calendar.saturday = row[6]
      calendar.sunday = row[7]
      calendar.start_date = row[8]
      calendar.end_date = row[9]
      calendars << calendar
    end
    Calendar.import calendars
    puts "Rake::Info imported #{calendars.length} Calendars"
    puts "Rake::End #{task_name}"
  end

  task calendar_dates: :environment do |task_name|
    puts "Rake::Start #{task_name}"
    file = CsvBl::ReadFile.run!(path: CALENDAR_DATES_CSV)
    calendar_dates = []
    file[:rows].each do |row|
      calendar_date = CalendarDate.new
      calendar_date.calendar_id = row[0]
      calendar_date.date = row[1]
      calendar_date.exception_type = row[2]
      calendar_dates << calendar_date
    end
    Calendar.import calendar_dates
    puts "Rake::Info imported #{calendar_dates.length} Calendar Dates"
    puts "Rake::End #{task_name}"
  end

  task stops: :environment do |task_name|
    puts "Rake::Start #{task_name}"
    file = CsvBl::ReadFile.run!(path: STOPS_CSV)
    stops = []
    file[:rows].each do |row|
      stop = Stop.new
      stop.id = row[0]
      stop.code = row[1]
      stop.name = row[2]
      stop.stop = row[3]
      stop.lat = row[4]
      stop.lon = row[5]
      stop.url = row[6]
      stop.location_type = row[7]
      stop.parent_station = row[8]
      stops << stop
    end
    Stop.import stops
    puts "Rake::Info imported #{stops.length} Stops"
    puts "Rake::End #{task_name}"
  end

  task trips: :environment do |task_name|
    puts "Rake::Start #{task_name}"
    file = CsvBl::ReadFile.run!(path: TRIPS_CSV)
    trips = []
    file[:rows].each do |row|
      trip = Trip.new
      trip.id = row[2]
      trip.route_id = Route.find_by(short_name: row[0]).id
      trip.calendar_id = row[1]
      trip.trip_headsign = row[3]
      trip.trip_short_name = row[4]
      trip.direction_id = row[5]
      trip.block_id = row[6]
      trip.shape_id = row[7]
      trips << trip
    end
    Trip.import trips
    puts "Rake::Info imported #{trips.length} Trips"
    puts "Rake::End #{task_name}"
  end

  task stop_times: :environment do |task_name|
    puts "Rake::Start #{task_name}"
    file = CsvBl::ReadFile.run!(path: STOP_TIMES_CSV)
    stop_times = []
    file[:rows].each do |row|
      stop_time = StopTime.new
      stop_time.trip_id = row[0]
      stop_time.arrival = row[1]
      stop_time.departure = row[2]
      stop_time.stop_id = row[3]
      stop_time.stop_sequence = row[4]
      stop_time.stop_headsign = row[5]
      stop_time.pickup_type = row[6]
      stop_time.drop_off_type = row[7]
      stop_time.shape_dist_traveled = row[8]
      stop_times << stop_time
    end
    StopTime.import stop_times
    puts "Rake::Info imported #{stop_times.length} Stop Times"
    puts "Rake::End #{task_name}"
  end
end
