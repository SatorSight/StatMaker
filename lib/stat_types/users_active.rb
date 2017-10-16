class UsersActive
  DESCRIPTION = :'Count all subscribed users of service and close not subscribed with end_date'

  include StatInterface

  def run

    set_vars

    active_counter = 0
    tech = @service.tech

    users = @subscription.users
                .includes(:user_subscriptions, :operator)
                .joins("inner join user_subscription us
    on user.id = us.user_id
    and us.sub_id = #{@subscription.id}
    and us.end_date is null")
                # .order('id desc')
                # .limit 50

    user_subs_to_update_ids = []

    api = Bridge::Api.new
    api.set_access_token
    api.prepare_request
    api.set_service_tech tech

    users.each do |user|
      user_subs = user.user_subscriptions

      user_subs.each do |user_sub|
        if user_sub.sub_id == @subscription.id
          unless user_sub.end_date.present?
            if api.user_subscribed? user
              active_counter += 1
            else
              user_subs_to_update_ids.push user_sub.id
            end
          end
        end
      end
    end

    UserSubscription.where( id: user_subs_to_update_ids )
        .update_all( end_date: Time.now )

    save_results active_counter
  end
end