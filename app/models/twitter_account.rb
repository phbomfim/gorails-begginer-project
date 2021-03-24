class TwitterAccount < ApplicationRecord
  belongs_to :user

  validates :username, uniqueness: true #only accept a unique twitter_account.username each user
end
