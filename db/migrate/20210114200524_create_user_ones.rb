class CreateUserOnes < ActiveRecord::Migration[5.2]
  def change
    create_table :user_ones do |t|
      t.string :name
      t.string :phone

      t.boolean :app1
      t.boolean :app2
      t.boolean :app3
      t.boolean :app4
      t.boolean :app5

      t.string :naverid
      t.string :url

      t.boolean :submitted

      t.integer :event_id, foreign_key: true

      t.timestamps
    end
  end
end
