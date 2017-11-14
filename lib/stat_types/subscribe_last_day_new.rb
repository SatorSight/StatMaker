class SubscribedLastDayNew
  DESCRIPTION = :'Count all subscribed users for service for last 24 hours with new table'

  include StatInterface

  def run

    set_vars

    domain = @subscription.domain
    sub = domain[0, domain.index('.')]
    user_subscriptions_count = SubscriptionLog
                                   .where(subscription: sub)
                                   .where('datetime >= ?', 1.day.ago)
                                   .count

    save_results user_subscriptions_count

  end
end