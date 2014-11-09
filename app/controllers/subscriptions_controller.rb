class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def create
    sc = StockCompany.where(subscription_params).first
    if sc.nil?
      redirect_to subscriptions_path, flash: { error: 'Stock company not found' }
      return
    end

    if current_user.target_companies.include?(sc)
      redirect_to subscriptions_path, flash: { error: 'You have subscribed' }
      return
    end

    flash[:notice] = 'Stock company added' if current_user.target_companies << sc

    redirect_to subscriptions_path
  end

  def destroy
    sub = Subscription.destroy(params[:id])
    if sub.subscribed == current_user && sub.destroy
      flash[:notice] = 'Subscription canncelled'
    else
      flash[:error] = 'Somethings wrong..'
    end

    redirect_to subscriptions_path
  end

  def index
    @subscriptions = current_user.subscriptions.stock_companies
  end

  private

  def subscription_params
    params.require(:subscription).permit(:code)
  end
end
