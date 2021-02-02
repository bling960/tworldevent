class CreateEventThrees < ActiveRecord::Migration[5.2]
  def change
    create_table :event_threes do |t|
      t.string :color

      t.text :text1
      t.text :text2

      t.string :text3_headline
      t.text :text3
      t.string :text4_headline
      t.text :text4

      t.text :text5

      t.text :text6
      t.text :text7

      t.text :option1
      t.text :option2
      t.text :option3
      t.text :option4
      t.text :option5

      t.integer :event_id, foreign_key: true

      t.timestamps
    end
  end
end
