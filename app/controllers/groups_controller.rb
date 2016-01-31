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

class GroupsController < ApplicationController
  permits :name, :display_order, :message_pattern_id

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/:id/edit
  def edit(id)
    @group = Group.find(id)
  end

  # POST /groups
  def create(group)
    @group = Group.new(group)
    @group.user = current_user

    if @group.save
      redirect_to :root, notice: 'Group was successfully created.'
    else
      render :new
    end
  end

  def update(id, group)
    @group = Group.find(id)
    if @group.update(group)
      redirect_to :root
    else
      render :edit
    end
  end

  # AJAX: PATCH /groups/:group_id/change_order
  def change_order(group_id, order)
    @group = Group.find(group_id)

    old_order = @group.display_order
    new_order = order.to_i

    # 値が大きくなる場合、他のグループの値を1減らす
    if old_order < new_order
      Group.update_order(old_order, new_order + 1, -1)
    else
      Group.update_order(new_order - 1, old_order,  1)
    end

    @group.update(display_order: new_order)

    render nothing: true

  end

  def new_accounts(id)
    @group = Group.find(id)
  end

  def create_accounts(id, list, auto_update=false, auto_follow=false ,auto_unfollow=false ,auto_direct_message=false ,auto_retweet=false)
    @group = Group.find(id)
    accounts = []
    CSV.parse(list, col_sep: "\t") do |row|
      a = Account.find_or_initialize_by(
        screen_name: row[0],
      )
      if a
        a.group_id            = @group.id
        a.screen_name         = row[0]
        a.consumer_key        = row[1]
        a.consumer_secret     = row[2]
        a.access_token        = row[3]
        a.access_secret       = row[4]
        a.auto_update         = auto_update
        a.auto_follow         = auto_follow
        a.auto_unfollow       = auto_unfollow
        a.auto_direct_message = auto_direct_message
        a.auto_retweet        = auto_retweet
        accounts << a
      end
    end
    Account.import accounts
    redirect_to :root
  end

end
