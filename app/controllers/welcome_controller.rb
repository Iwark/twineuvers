class WelcomeController < ApplicationController
  def index
    @groups = current_user.groups.order(:display_order).includes([{accounts: :target}, :message_pattern])
  end
end