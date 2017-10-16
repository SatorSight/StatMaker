class UsersActive
  DESCRIPTION = :'Count all subscribed users of service and close not subscribed with end_date'

  include StatInterface

  def run



    set_vars

    active_counter = 0
    tech = @service.tech
    # users = @subscription.users


=begin
    select count(u.id)
from user u
inner join user_subscription us
    on u.id = us.user_id
    and us.sub_id = 3
    and us.end_date is not null
;
=end

    # uu = User.joins(:user_subscription).where(
    #     user_subscription: { id: 3, end_date:  }
    # )


=begin
    23485
=end

    users = @subscription.users
                .includes(:user_subscriptions, :operator)
                .joins("inner join user_subscription us
    on user.id = us.user_id
    and us.sub_id = #{@subscription.id}
    and us.end_date is not null")

    #
    #
    # users.each do |user|
    #   pp 'user started'
    #
    #   us = user.user_subscriptions
    #
    #   us.each do |s|
    #     if s.end_date.present?
    #       pp 'yes'
    #
    #     else
    #       pp 'no'
    #     end
    #   end
    #   pp 'user ended'
    # end
    #
    # exit





    # users = User
    #             .includes(:user_subscriptions, :operator)
    #             .joins("inner join user_subscription us
    # on user.id = us.user_id
    # and us.sub_id = #{@subscription.id}
    # and us.end_date is not null").limit 10

    # pp users.size
    # exit


    user_subs_to_update_ids = []



    # user_subs_to_update_ids = [10,11]
    # UserSubscription.where( id: user_subs_to_update_ids )
    #     .update_all( end_date: Time.now )
    # exit


    # pp users.user_subscriptions
    # exit

    api = Bridge::Api.new
    api.set_access_token
    api.prepare_request
    api.set_service_tech tech

    users.each do |user|
      # user_sub = user.user_subscriptions.where(sub_id: @subscription.id).first
      user_subs = user.user_subscriptions

      user_subs.each do |user_sub|
        if user_sub.sub_id == @subscription.id
          if user_sub.end_date.present?
            if api.user_subscribed? user
              active_counter += 1
            else
              user_subs_to_update_ids.push user_sub.id
              # user_sub.end_date = Time.now
              #
              # user_sub.save
            end
          end
        end
      end
    end

    UserSubscription.where( id: user_subs_to_update_ids )
        .update_all( end_date: Time.now )

    # pp active_counter
    # exit


    # users.each do |user|
    #   user_sub = user.user_subscriptions.where(sub_id: @subscription.id).first
    #   if api.user_subscribed? user
    #     active_counter += 1
    #   else
    #     user_sub.end_date = Time.now
    #
    #     user_sub.save
    #   end
    # end

    save_results active_counter

  end
end