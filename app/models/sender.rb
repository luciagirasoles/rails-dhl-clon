class Sender < ApplicationRecord
  has_many :senders, dependent: :destroy
end
