class AddServicesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.string :title
      t.integer :order
    end
  end
end