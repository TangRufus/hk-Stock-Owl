class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def create
    case type_params[:type]
    when 'ex_tags'
      subscriptable = ExTag.find_by(ex_tag_params)
    else
      subscriptable = StockCompany.find_by(stock_company_params)
    end

    if subscriptable.nil?
      flash[:error] = 'Not found'
    elsif current_user.subscribed?(subscriptable)
      flash[:error] = 'You have subscribed'
    else
      if Subscription.new(subscribed: current_user, subscriptable: subscriptable).save
        flash[:notice] = 'Added'
      else
        flash[:error] = 'Something wrong'
      end
    end
    redirect_to action: 'index', type: type_params[:type]
  end

  def destroy
    sub = Subscription.find_by(id: params[:id])
    if sub.present? && sub.subscribed == current_user && sub.destroy
      flash[:notice] = 'Subscription canncelled'
    else
      flash[:error] = 'Somethings wrong..'
    end

    redirect_to action: 'index', type: type_params[:type]
  end

  def index
    case params[:type]
    when 'ex_tags'
      @subscriptions = current_user.subscriptions.ex_tags
      render 'subscriptions/ex_tags_index'
    else
      @subscriptions = current_user.subscriptions.stock_companies
    end
  end

  private

  def stock_company_params
    params.require(:subscription).permit(:code)
  end

  def ex_tag_params
    params.require(:subscription).permit(:name)
  end

  def type_params
    params.require(:subscription).permit(:type)
  end
end
