task :run_all => :environment do
  Rails.logger.level = Logger::DEBUG
  services = Service.all
  services.each do |service|
    puts 'Running ' + service.title + ' stat tasks'

    stat_types = service.stat_types.where active: 1

    stat_types.each do |stat_type|
      puts 'Collecting ' + stat_type.stat_class + ' data'
      start = Time.now

      class_name = Object.const_get stat_type.stat_class
      handler = class_name.new
      handler.set_service_id service.id
      handler.run

      finish = Time.now
      diff = finish - start
      puts "Finished for #{diff.to_s} seconds"
    end
  end
end