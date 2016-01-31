# coding: utf-8
# == Schema Information
#
# Table name: sent_messages
#
#  id                :integer          not null, primary key
#  account_id        :integer
#  direct_message_id :integer
#  to_user_id        :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#


class SentMessagesController < ApplicationController

  def index
    @message_patterns = MessagePattern.includes(direct_messages:[sent_messages: :account])
  end

end
