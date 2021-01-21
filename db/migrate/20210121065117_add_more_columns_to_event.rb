class AddMoreColumnsToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :order, :integer, default: 99
  end
end
