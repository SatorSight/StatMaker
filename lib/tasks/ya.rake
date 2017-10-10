task :ya => :environment do

  include Metrika
  require 'oauth2'

  token = 'AQAAAAAJroNSAASSMsJ5FtIsfEGZmZgr-3zM-sY'


  # client ||= OAuth2::Client.new(@application_id, @application_password, DEFAULT_OAUTH_OPTIONS.dup)

  # noinspection RubyArgCount
  client = Metrika::Client.new('3e65055f4bb7474591bec61db2851665', '53d68c7ba4c541eeaae9ad0f4e094d9d')
  client.restore_token token


  client.test_get

  # pp '---'
  # pp client.authorization_url
  # pp '---'



  # token = '05dd3dd84ff948fdae2bc4fb91f13e22bb1f289ceef0037'
  # code = '4148276'

  # client.authorize_token(code)

=begin
  https://api-metrika.yandex.ru/stat/v1/data.json?id=2138128&metrics=ym:s:avgPageViews&dimensions=ym:s:operatingSystem&limit=5&oauth_token=05dd3dd84ff948fdae2bc4fb91f13e22bb1f289ceef0037

group by executionkey, msisdn, dt, operatorid

=end

  # pp client.auth_code

  # client.restore_token(token)
  # client.restore_token(code)


  pp 'Done!'

  # #
  # all_counters = client.get_counters
  # pp all_counters
  #
  # array = []
  # all_counters.each do |counter|
  #   if counter['status'] == 'Active'
  #
  #
  #     element = {}
  #     element[:id] = counter['id']
  #     element[:name] = counter['name']
  #     element[:site] = counter['site']
  #
  #     array.push element
  #
  #   end
  # end
  #
  # # pp array
  #
  # # client.creater_counter(params)
  # counter = client.get_counter(44406319)
  # pp counter
  # client.update_counter(id, params)
  # client.delete_counter(id)
  # client.check_counter(id)


end