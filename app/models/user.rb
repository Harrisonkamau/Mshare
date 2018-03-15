class User < ApplicationRecord
  has_one :account
  has_many :transactions

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Create user account while creating user model
  after_create do |user|
    Account.create!(
      :user_id => user.id,
      :account_balance => 0
    )
end
end
