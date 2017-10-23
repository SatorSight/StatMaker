class AverageLifeTime
  DESCRIPTION = :'Measure average user subscription lifetime for last 24 hours'

  include StatInterface

  def run

    set_vars

    user_subscriptions = UserSubscription
                                   .where(sub_id: @subscription.id)
                                   .where('end_date is not null')
                                   .where('start_date >= ?', 1.day.ago)

    intervals = []

    user_subscriptions.each do |ur|
      interval = ur.end_date - ur.start_date
      intervals.push interval
    end

    if intervals.size != 0
      average = intervals.sum / intervals.size.to_f
    else
      average = 0
    end

    save_results average

  end
end