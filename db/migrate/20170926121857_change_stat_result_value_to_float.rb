class ChangeStatResultValueToFloat < ActiveRecord::Migration[5.1]
  def change
    change_column :stat_results, :value, :float
  end
end
