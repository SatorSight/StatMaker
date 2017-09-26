class User < ActiveRecord::Base
  self.table_name = 'user'
  belongs_to :operator
  has_and_belongs_to_many :subscriptions,
                          join_table: 'user_subscription',
                          foreign_key: 'sub_id'
  has_many :user_subscriptions
end