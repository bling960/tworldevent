class AddColumnsToSetting < ActiveRecord::Migration[5.2]
  def change
    add_column :settings, :store, :string
  end
end
