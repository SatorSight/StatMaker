class AddStatResultsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :stat_results do |t|
      t.integer :value

      t.timestamps
    end

    add_reference :stat_results, :service, index: true
    add_reference :stat_results, :stat_type, index: true

  end
end
