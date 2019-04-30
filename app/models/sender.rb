class Sender < ApplicationRecord
  has_many :senders, dependent: :destroy
  validates :order_id, numericality: { greater_than: 0 }

end
