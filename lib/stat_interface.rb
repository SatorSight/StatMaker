module StatInterface
  def get_self_stat_type
    StatType.find_by_stat_class self.class.to_s
  end

  def set_service_id(service_id)
    @service_id = service_id
  end

  def set_vars
    @service = Service.find(@service_id)
    @subscription = Subscription.find_by domain: @service.domain
  end

  def save_results(result)
    stat_result = StatResult.new
    stat_result.service = @service
    stat_result.stat_type = get_self_stat_type
    stat_result.value = result
    stat_result.save
  end
end