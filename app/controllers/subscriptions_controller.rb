class SubscriptionsController < ApplicationController
  def create
  end

  def destroy
    sub = Subscription.destroy(params[:id])
    if sub.user == current_user && sub.destroy
        flash[:notice] = 'Subscription canncelled'
      else
        flash[:error] = 'Somethings wrong..'
      end

    redirect_to subscriptions_path
  end

  def index
    @subscriptions = current_user.subscriptions
  end

end
