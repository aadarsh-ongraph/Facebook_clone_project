class AddColumnToFriendship < ActiveRecord::Migration[7.0]
  def change
    add_column :friendships, :sender_id, :integer
    add_column :friendships, :receiver_id, :integer
    add_column :friendships, :status, :string
  end
end
