class UnsubscribedThreeDays
  DESCRIPTION = :'Count all unsubscribed users for service for last 72 hours'

  include StatInterface

  def run

    set_vars

    results = UserSubscription
                  .where(sub_id: @service_id)
                  .where('end_date is not null')
                  .where('datediff(end_date, start_date) < 1')
                  .where('start_date >= ?', 1.day.ago)
                  .count

    save_results results

  end
end