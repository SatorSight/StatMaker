class SubscribedLastDay
  DESCRIPTION = :'Count all subscribed users for service for last 24 hours'

  include StatInterface

  def run

    set_vars

    user_subscriptions_count = UserSubscription
                             .where(sub_id: @subscription.id)
                             .where('start_date >= ?', 1.day.ago)
                             .count

    save_results user_subscriptions_count

  end
end