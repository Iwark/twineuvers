# == Schema Information
#
# Table name: groups
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  display_order      :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  message_pattern_id :integer
#  user_id            :integer
#

require 'rails_helper'

RSpec.describe Group, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
