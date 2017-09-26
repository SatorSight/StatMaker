class UnsubscribedLastDay
  DESCRIPTION = :'Count all unsubscribed users for service for last 24 hours'

  include StatInterface

  def run

    set_vars

    user_subscriptions_count = UserSubscription
                             .joins(:user)
                             .where(sub_id: @subscription.id)
                             .where('end_date >= ?', 1.day.ago)
                             .count

    save_results user_subscriptions_count

  end
end