class DashboardsController < ApplicationController
  def index
    @accounts = Account.all
    @account_balance = account_balance
  end

  private

  def account_balance
    if current_user
      current_user.account.account_balance.to_i
    end
  end
end
