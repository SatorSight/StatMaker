desc 'Create new stat'
task :add_new_sub_24h_stat => :environment do
  Rails.logger.level = Logger::DEBUG

  new_stat = StatType.new
  new_stat.name = 'subscribed_for last_24_hours_new'
  new_stat.order = 9
  new_stat.title = 'Subscribed for last 24 hours new'
  new_stat.stat_class = 'SubscribedLastDayNew'
  new_stat.active = 1
  new_stat.stat_source_type_id = 1
  new_stat.save

  8.times do |i|
    new_service_stat_type = ServiceStatType.new
    new_service_stat_type.stat_type_id = new_stat.id
    new_service_stat_type.service_id = i+1
    new_service_stat_type.save
  end
end