class StatType < ActiveRecord::Base
  has_and_belongs_to_many :services
end