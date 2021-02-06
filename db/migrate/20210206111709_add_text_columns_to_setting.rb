class AddTextColumnsToSetting < ActiveRecord::Migration[5.2]
  def change
    add_column :settings, :headline3, :string
    add_column :settings, :description2, :text
    add_column :settings, :youtube, :string
    add_column :settings, :kakao, :string
  end
end
