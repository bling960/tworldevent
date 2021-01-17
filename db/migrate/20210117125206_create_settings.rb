class CreateSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :settings do |t|

      t.string :headline1
      t.string :headline2
      t.string :description
      t.string :blog
      t.string :instagram

      t.timestamps
    end
  end
end
