module Metrika
  module Routes



    METRICS = {
        :visits => 'ym:s:visits',
        :visits => 'ym:s:pageviews',
        :visits => 'ym:s:bounceRate',
        :visits => 'ym:s:pageDepth',
        :visits => 'ym:s:avgVisitDurationSeconds',
        :visits => 'ym:s:visitsPerDay',
        :visits => 'ym:s:visitsPerHour',
        :visits => 'ym:s:visitsPerMinute',
        :visits => 'ym:s:robotPercentage',
        :visits => 'ym:s:percentNewVisitors',
        :visits => 'ym:s:newUsers',
        :visits => 'ym:s:newUserVisitsPercentage',
        :visits => 'ym:s:upToDaySinceFirstVisitPercentage',
        :visits => 'ym:s:upToWeekSinceFirstVisitPercentage',
        :visits => 'ym:s:upToMonthSinceFirstVisitPercentage',
        :visits => 'ym:s:upToQuarterSinceFirstVisitPercentage',
        :visits => 'ym:s:upToYearSinceFirstVisitPercentage',
        :visits => 'ym:s:overYearSinceFirstVisitPercentage',
        :visits => 'ym:s:oneVisitPerUserPercentage',
        :visits => 'ym:s:upTo3VisitsPerUserPercentage',
        :visits => 'ym:s:upTo7VisitsPerUserPercentage',
        :visits => 'ym:s:upTo31VisitsPerUserPercentage',
        :visits => 'ym:s:over32VisitsPerUserPercentage',
        :visits => 'ym:s:oneDayBetweenVisitsPercentage',
        :visits => 'ym:s:upToWeekBetweenVisitsPercentage',
        :visits => 'ym:s:visits',
        :visits => 'ym:s:visits',
        :visits => 'ym:s:visits',
        :visits => 'ym:s:visits',
        :visits => 'ym:s:visits',
        :visits => 'ym:s:visits',
        :visits => 'ym:s:visits',
        :visits => 'ym:s:visits',
        :visits => 'ym:s:visits',
        :visits => 'ym:s:visits',
        :visits => 'ym:s:visits',
        :visits => 'ym:s:visits',
        :visits => 'ym:s:visits',
        :visits => 'ym:s:visits',
        :visits => 'ym:s:visits',
        :visits => 'ym:s:visits',
        :authorize_url => 'https://oauth.yandex.ru/authorize',
        :token_url => 'https://oauth.yandex.ru/token'
    }

    def base
      'https://api-metrika.yandex.ru'
    end

    def stat_route
      '/stat/v1/data'
    end

    def by_time
      '/bytime'
    end




  end
end