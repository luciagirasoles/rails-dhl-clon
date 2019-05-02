class OrderCountryQuery
  def top_5_countries_senders
    Shipment.joins(:sender).group('shipments.id, senders.country').order('count(senders.country) DESC').limit(5)
  end

  def top_5_countries_recipients
    Shipment.joins(:recipient).group('shipments.id, users.country').order('count(users.country) DESC').limit(5)
  end
end