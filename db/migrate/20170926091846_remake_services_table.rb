class RemakeServicesTable < ActiveRecord::Migration[5.1]
  def change
    add_column :services, :tech, :string
  end
end