require 'access_token'
require 'httparty'

class SafaricomB2c
  class << self
    def call(phone_number, amount)
      new(phone_number, amount).push_payment
    end
  end

  attr_reader :phone_number, :amount

  def initialize phone_number, amount
    @phone_number = phone_number
    @amount = amount
  end

  def push_payment
    response = HTTParty.post(url, headers: headers, body: payload)
    response.body
  end

  private

  def url
    "#{ENV['SAFARICOM_BASE_URL']}/mpesa/b2c/v1/paymentrequest"
  end

  def payload
    {
      InitiatorName: ENV['INITIATOR_NAME'],
      SecurityCredential: ENV['SECURITY_DETAIL'],
      CommandID: "SalaryPayment",
      Amount: amount,
      PartyA: ENV['SHORTCODE'],
      PartyB: phone_number,
      Remarks: "Salary Payments",
      QueueTimeOutURL: "#{ENV['base_url']}/transactions/timeout",
      ResultURL: "#{ENV['base_url']}/transactions/create"
    }.to_json
  end

  def headers
    headers = {
      "Authorization" => "Bearer #{get_token}",
      "Content-Type" => "application/json"
    }
  end

  def get_token
    AccessToken.new(ENV['CONSUMER_KEY'], ENV['CONSUMER_SECRET']).access_token
  end
end
