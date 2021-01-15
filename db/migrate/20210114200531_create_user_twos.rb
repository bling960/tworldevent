class CreateUserTwos < ActiveRecord::Migration[5.2]
  def change
    create_table :user_twos do |t|
      t.string :name
      t.string :phone
      t.string :code

      t.string :prize
      t.string :shop

      t.boolean :submitted

      t.timestamps
    end
  end
end
