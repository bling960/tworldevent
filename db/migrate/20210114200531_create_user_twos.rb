class CreateUserTwos < ActiveRecord::Migration[5.2]
  def change
    create_table :user_twos do |t|
      t.string :name
      t.string :phone

      t.string :prize
      t.string :shop

      t.boolean :submitted

      t.integer :event_id, foreign_key: true

      t.timestamps
    end
  end
end
