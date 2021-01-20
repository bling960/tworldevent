class AddMoreColumnsToSetting < ActiveRecord::Migration[5.2]
  def change
    add_column :settings, :copyright, :string
  end
end
