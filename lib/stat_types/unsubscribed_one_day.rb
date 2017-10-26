class UnsubscribedOneDay
  DESCRIPTION = :'Count all unsubscribed users for service for last 24 hours'

  include StatInterface

  def run

    set_vars

    results = UserSubscription
                  .where(sub_id: @service_id)
                  .where('end_date is not null')
                  .where('datediff(end_date, start_date) < 3')
                  .where('start_date >= ?', 3.day.ago)
                  .count

    save_results results

  end
end