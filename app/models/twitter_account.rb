class TwitterAccount < ApplicationRecord
  belongs_to :user
  has_many :tweets, dependent: :destroy

  validates :username, uniqueness: true #only accept a unique twitter_account.username each user

  def client
    Twitter::REST::Client.new do |config|
      config.consumer_key = Rails.application.credentials.dig(:twitter, :api_key) #From our API
      config.consumer_secret = Rails.application.credentials.dig(:twitter, :api_secret) #In /config/initalizers/omniauth.rb
      config.access_token = token #From our database
      config.access_token_secret = secret
    end
  end
end