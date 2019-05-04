class OrderSendersQuery
  def top_senders_packages_sent
    # Sender.joins(:shipments).group('senders.id').order('count(shipments.id) DESC')
    return Sender.joins(:shipments).group(:email).count("shipments.id").sort_by {|_key, value| value}.reverse.first(20).to_h
  end

  def top_senders_total_freight_value
    top_sender= Sender.joins(:shipments).group(:email).sum("shipments.freight_value")
   return top_sender.each{|k,v| top_sender.delete(k) if v < 1000}.sort_by {|_key, value| value}.reverse
  end

end