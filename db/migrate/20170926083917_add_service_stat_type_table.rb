class AddServiceStatTypeTable < ActiveRecord::Migration[5.1]
  def change
    create_table :service_stat_types, id: false do |t|
      t.belongs_to :stat_type, index: true
      t.belongs_to :service, index: true
    end
  end
end