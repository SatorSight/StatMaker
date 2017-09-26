class RenameStatTypeClassField < ActiveRecord::Migration[5.1]
  change_table :stat_types do |t|
    t.rename :class, :stat_class
  end
end