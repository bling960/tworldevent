class AddAnotherColumnToSetting < ActiveRecord::Migration[5.2]
  def change
    add_column :settings, :headline_event, :string
  end
end
