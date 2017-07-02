class ChangeColumnToFollowerHistory < ActiveRecord::Migration[4.2]
  def up
    change_column :follower_histories, :follower_ids, :text, default: nil
  end

  def down
    change_column :follower_histories, :follower_ids, :string, default: ""
  end
end
