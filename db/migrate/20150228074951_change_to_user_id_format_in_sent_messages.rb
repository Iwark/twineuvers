class ChangeToUserIdFormatInSentMessages < ActiveRecord::Migration[4.2]
  def up
    change_column :sent_messages, :to_user_id, :integer, limit: 8
  end

  def down
    change_column :sent_messages, :to_user_id, :integer, limit: 4
  end
end
