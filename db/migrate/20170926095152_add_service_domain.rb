class AddServiceDomain < ActiveRecord::Migration[5.1]
  def change
    add_column :services, :domain, :string
  end
end