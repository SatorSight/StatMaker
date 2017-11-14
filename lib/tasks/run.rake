desc 'Commence gathering data for all active reports or selected for all services or selected'
task :run, [:service_id, :stat_id] => :environment do |t, args|
  Rails.logger.level = Logger::DEBUG
  services = []

  if args[:service_id].nil?
    services = Service.all
  else
    services.push Service.find args[:service_id]
  end

  services.each do |service|
    puts 'Running ' + service.title + ' stat tasks'

    if args[:stat_id].nil?
      stat_types = service.stat_types.where active: 1
    else
      stat_types = service.stat_types.where(id: args[:stat_id].to_i).take
      unless stat_types.is_a? Array
        stat_types = [stat_types]
      end
    end

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