class UsersActive
  DESCRIPTION = :'Count all subscribed users of service and close not subscribed with end_date'

  include StatInterface

  def run

    set_vars

    active_counter = 0
    tech = @service.tech

    users = @subscription.users

    api = Bridge::Api.new
    api.set_access_token
    api.set_service_tech tech

    users.each do |user|
      user_sub = user.user_subscriptions.where(sub_id: @subscription.id).first

      if user_sub.end_date.present?
        if api.user_subscribed? user
          active_counter += 1
        else
          user_sub.end_date = Time.now

          user_sub.save
        end
      end
    end

    save_results active_counter

  end
end