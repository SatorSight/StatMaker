class AddActiveToStatTypes < ActiveRecord::Migration[5.1]
  def change
    add_column :stat_types, :active, :integer, default: 1
  end
end