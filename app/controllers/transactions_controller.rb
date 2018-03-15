class TransactionsController < ApplicationController
  def timeout
    puts params
  end

  def index
    @transactions = Transaction.all
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = TransactionCreator.new(transaction_params).call
    @transaction.save!
  end


  def transfer
    render template: 'transactions/_transfer'
  end

  def load
    render template: 'transactions/_load'
  end

  private

  def transaction_params
    params.permit(
      :transaction_type,
      :sender_id,
      :receiver_id,
      :amount
    )
  end
end
