class AddStatTypesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :stat_types do |t|
      t.string :name
      t.integer :order
    end
  end
end