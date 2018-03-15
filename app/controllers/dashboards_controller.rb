class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @accounts = Account.all
    @account_balance = account_balance
  end

  private

  def account_balance
    current_user.account.account_balance.to_i
  end
end
