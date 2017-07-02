class AddFriendIdsToFollowerHistory < ActiveRecord::Migration[4.2]
  def change
    add_column :follower_histories, :friend_ids, :text
  end
end
