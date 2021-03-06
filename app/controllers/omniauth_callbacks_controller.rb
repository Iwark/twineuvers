class OmniauthCallbacksController < ApplicationController
  def twitter
    auth        = request.env["omniauth.auth"]
    group_id    = request.env['omniauth.params']["group_id"]
    screen_name = auth.extra.access_token.params[:screen_name]
    account     = Account.find_by(screen_name: screen_name)
    unless account
      account = Account.create(
        group_id:      group_id.to_i,
        screen_name:   screen_name,
        access_token:  auth.credentials.token,
        access_secret: auth.credentials.secret
      )
    else
      account.update(
        access_token:  auth.credentials.token,
        access_secret: auth.credentials.secret
      )
    end
    redirect_to :root
  end
end
