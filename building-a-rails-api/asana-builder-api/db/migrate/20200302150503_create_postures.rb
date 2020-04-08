class CreatePostures < ActiveRecord::Migration[6.0]
  def change
    create_table :postures do |t|
      t.integer :asana_id
      t.integer :sequence_id
      t.integer :duration
      t.text :variation
      t.timestamps
    end
  end
end
