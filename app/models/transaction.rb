class Transaction < ApplicationRecord
  belongs_to :user

  TRANSACTION_TYPES = [
    'load', 'transfer'
  ]
end
