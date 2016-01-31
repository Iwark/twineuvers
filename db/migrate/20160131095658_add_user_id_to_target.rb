class AddUserIdToTarget < ActiveRecord::Migration
  def change
    add_reference :targets, :user, index: true, foreign_key: true
  end
end
