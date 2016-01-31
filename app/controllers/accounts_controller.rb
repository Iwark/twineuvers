# == Schema Information
#
# Table name: accounts
#
#  id                  :integer          not null, primary key
#  group_id            :integer          not null
#  screen_name         :string(255)      not null
#  access_token        :string(255)      not null
#  access_secret       :string(255)      not null
#  friends_count       :integer          default(0)
#  followers_count     :integer          default(0)
#  description         :string(255)      default("")
#  auto_update         :boolean          default(TRUE)
#  auto_follow         :boolean          default(TRUE)
#  auto_unfollow       :boolean          default(TRUE)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  auto_direct_message :boolean          default(TRUE)
#  target_id           :integer
#  auto_retweet        :boolean          default(TRUE)
#

class AccountsController < ApplicationController
  permits :screen_name, :group_id, :target_id, :description,
    :consumer_key, :consumer_secret, :access_token, :access_secret,
    :auto_update, :auto_follow, :auto_unfollow, :auto_direct_message, :auto_retweet

  def show(id)
    @account = Account.find(id)
    @followers_count_data = {}
    @account.follower_histories.where(FollowerHistory.arel_table[:created_at].gt(7.days.ago)).group(:created_at).sum(:followers_count).each do |k, v|
      @followers_count_data[k] = v
    end
  end

  def new(group_id)
    @account = Account.new(group_id: group_id)
  end

  def edit(id)
    @account = Account.find(id)
  end

  def create(account)
    if @account = Account.create(account)
      redirect_to :root, notice: 'Account was successfully created.'
    else
      render :new
    end
  end

  # PATCH /accounts
  def update(id, account)
    @account =  Account.find(id)

    if @account.update(account)
      redirect_to :root, notice: 'Account was successfully updated.'
    else
      render :edit
    end
  end

  # PATCH /accounts/1/update_status
  def update_status(id)
    Account.find(id).update_status!
    redirect_to :root
  end

  # DELETE /accounts/1
  def destroy(id)
    @account =  Account.find(id)
    @account.destroy

    redirect_to :root, notice: 'Account was successfully destroyed.'
  end

end
