module Enum

  AUTH_URL = 'https://bridge-api.buongiorno.com/v1/oauth2/token'
  SUBSCRIPTION_INFO_URL = 'https://bridge-api.buongiorno.com/v1/res/ru/subscriptionInfo'
  GRANT_TYPE = 'client_credentials'
  CLIENT_ID = 'da3e80c5_9452334b6b47864ff57b3f4f1a1f245a'
  CLIENT_SECRET = 'e467b0c3_173509dc85cd0c5c6d77ec33ff2b6b08'
  COUNTRY = 'ru'

  CONTENT_JSON_TYPE = 'application/json'
  CONTENT_FORM_TYPE = 'application/x-www-form-urlencoded'


  def get_tech_by_service(service)

    tech = 'burda_ikioske'
    tech = 'kioskplus_tech' if service.tech.include? 'tech'
    tech = 'kioskplus_food' if service.tech.include? 'food'
    tech = 'kioskplus_avto' if service.tech.include? 'avto'
    tech = 'kioskplus_kind' if service.tech.include? 'kind'
    tech = 'kioskplus_men' if service.tech.include? 'men'
    tech = 'kioskplusstyle' if service.tech.include? 'style'
    tech = 'kioskplushome' if service.tech.include? 'home'

    tech

  end


end