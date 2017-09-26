class UserSubscription < ActiveRecord::Base
  self.table_name = 'user_subscription'
  belongs_to :user
end