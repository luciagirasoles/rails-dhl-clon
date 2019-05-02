class OrderCountryQuery
  def top_5_countries
    Shipment.group('id').order('count(shipments.origin_country)').limit(5)
  end
end