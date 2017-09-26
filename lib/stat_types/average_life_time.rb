class AverageLifeTime
  DESCRIPTION = :'Measure average user subscription lifetime'

  include StatInterface

  def run

    set_vars

    user_subscriptions = UserSubscription
                                   .where(sub_id: @subscription.id)
                                   .where('end_date is not null')

    intervals = []

    user_subscriptions.each do |ur|
      interval = ur.end_date - ur.start_date
      intervals.push interval
    end

    average = intervals.instance_eval { reduce(:+) / size.to_f }

    save_results average

  end
end