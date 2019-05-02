class OrderSendersQuery
  def top_senders_packages_sent
    Sender.joins(:shipments)
          .group('senders.id')
          .order('count(shipments.id) DESC')
  end

  def top_senders_total_freight_value
    Sender.joins(:shipments)
          .group('senders.id')
          .order('sum(shipments.freight_value) DESC')
          .having('sum(shipments.freight_value) > 1000')
  end
end