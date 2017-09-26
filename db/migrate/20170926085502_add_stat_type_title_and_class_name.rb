class AddStatTypeTitleAndClassName < ActiveRecord::Migration[5.1]
  def change
    add_column :stat_types, :title, :string
    add_column :stat_types, :class, :string
  end
end
