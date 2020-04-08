class CreateAsanas < ActiveRecord::Migration[6.0]
  def change
    create_table :asanas do |t|
      t.string :name
      t.string :english
      t.string :sanskrit
      t.string :category
      t.string :effect_on_spine
      t.string :suitable_for_meditation
      t.string :img
      t.timestamps
    end
  end
end
