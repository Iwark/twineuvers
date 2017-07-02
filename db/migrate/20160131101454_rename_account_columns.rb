class RenameAccountColumns < ActiveRecord::Migration[4.2]
  def change
    change_table :accounts do |t|
      t.rename :oauth_token, :access_token
      t.rename :oauth_token_secret, :access_secret
    end
  end
end
