class TransactionCreator
  attr_reader :params, :sender, :recipient, :amount

  def initialize(params)
    @params = params
  end

  def call
    if params[:transaction_type] == 'transfer'
      return transfer(sender, recipient, amount)
    else
      return load(amount, recipient)
    end
  end


  private


  def load(amount, recipient)
  end

  def transfer(sender, recipient, amount)
    create_transaction(
      transaction_type:transaction_type,
      sender_id: sender.id,
      receiver_id: recipient.id,
      amount: amount
    )
  end

  def create_transaction(params)
    @transaction = Transaction.create!(
      params
    )
  end

end
