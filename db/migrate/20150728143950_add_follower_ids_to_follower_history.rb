class AddFollowerIdsToFollowerHistory < ActiveRecord::Migration[4.2]
  def change
    add_column :follower_histories, :follower_ids, :string, default: ""
  end
end
