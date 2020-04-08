class AddUserIdToSequences < ActiveRecord::Migration[6.0]
  def change
    add_column :sequences, :user_id, :integer
  end
end
