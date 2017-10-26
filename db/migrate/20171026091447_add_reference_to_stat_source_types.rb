class AddReferenceToStatSourceTypes < ActiveRecord::Migration[5.1]
  def change
    add_reference :stat_types, :stat_source_type, index: true
  end
end
