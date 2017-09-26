class AverageJournalReadCount
  DESCRIPTION = :'Count average journal read for service'

  include StatInterface

  def run

    set_vars

    query = 'SELECT avg(ujr.co) as result
            FROM (
              SELECT
                uj.user_id,
                count(uj.journal_id) AS co
              FROM (
                     SELECT
                       DISTINCT
                       ur.journal_id,
                       ur.user_id
                     FROM user_read ur
                     JOIN user u ON ur.user_id = u.id
                     JOIN user_subscription us ON u.id = us.user_id
                    WHERE us.sub_id = '+@subscription.id.to_s+'
                   ) uj
              GROUP BY uj.user_id
            ) ujr
            ;'

    ActiveRecord::Base.establish_connection
    res = ActiveRecord::Base.connection.execute query
    result_float = res.first.first

    save_results result_float

  end
end