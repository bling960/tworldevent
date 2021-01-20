class CreateEventOne < ActiveRecord::Migration[5.2]
  def change
    create_table :event_ones do |t|
      t.string :color
      t.string :text1
      t.text :text2
      t.string :text3
      t.text :text4
      t.text :text5
      t.text :text6

      t.string :caution1
      t.text :caution2
      t.string :caution3
      t.text :caution4

      t.integer :event_id, foreign_key: true
      
      t.timestamps
    end
  end
end
