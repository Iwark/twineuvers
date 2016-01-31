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

FactoryGirl.define do
  factory :group do
    name "MyString"
  end

end
