class StatsController < ApplicationController
  include Bridge

  def index

    #
    # user = User.find 6
    # user_sub = user.user_subscriptions.where(sub_id: 3).first
    # user_sub.end_date = Time.now
    # user_sub.save
    # pp user_sub


    a = AverageLifeTime.new
    a.set_service_id 1
    a.run







    # api = Bridge::Api.new
    #
    # api.set_access_token
    # api.set_service_id
    #
    #
    # users = User.all.limit 100
    #
    # users.each do |user|
    #   pp api.user_subscribed? user
    # end


  end

  def run_all_stats

  end

end