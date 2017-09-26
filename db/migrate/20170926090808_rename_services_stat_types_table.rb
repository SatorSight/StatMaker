class RenameServicesStatTypesTable < ActiveRecord::Migration[5.1]
  def change
    rename_table :service_stat_types, :services_stat_types
  end
end