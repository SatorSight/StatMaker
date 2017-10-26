class Add < ActiveRecord::Migration[5.1]
  def change

    create_table :stat_source_types do |t|
      t.string :title
      t.boolean :active
      t.string :code

      t.timestamps
    end

  end
end