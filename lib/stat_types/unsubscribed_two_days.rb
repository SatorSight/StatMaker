class UnsubscribedTwoDays
  DESCRIPTION = :'Count all unsubscribed users for service for last 48 hours'

  include StatInterface

  def run

    set_vars

    results = UserSubscription
                  .where(sub_id: @service_id)
                  .where('end_date is not null')
                  .where('datediff(end_date, start_date) < 2')
                  .where('start_date >= ?', 2.day.ago)
                  .count

    save_results results

  end
end