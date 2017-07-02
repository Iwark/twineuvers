class AddUserToSettings < ActiveRecord::Migration[4.2]
  def change
    add_reference :settings, :user, index: true, foreign_key: true
  end
end
