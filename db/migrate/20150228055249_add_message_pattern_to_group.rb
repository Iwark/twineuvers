class AddMessagePatternToGroup < ActiveRecord::Migration[4.2]
  def change
    add_reference :groups, :message_pattern, index: true
    add_foreign_key :groups, :message_patterns
  end
end
