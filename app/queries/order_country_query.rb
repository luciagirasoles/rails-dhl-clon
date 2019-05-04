class OrderCountryQuery
  def top_5_countries_senders
    Sender.joins(:shipments).group(:country).count.sort_by {|_key, value| value}.reverse.first(5).to_h
  end

  def top_5_countries_recipients
    User.joins("INNER JOIN shipments ON users.id = shipments.recipient_id").select("users.country, count(*) as TOTAL").group(:country).order("TOTAL DESC").limit(5) 
  end
end

