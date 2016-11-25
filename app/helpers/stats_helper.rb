module StatsHelper
  def age_mean(clients)
    array_ages = []
    clients.each { |client| array_ages << client.age if client.age.present? }
    age_mean = array_ages.inject{ |sum, el| sum + el }.to_f / array_ages.size
    age_mean
  end

  def price_mean_by_show(shows)
    array_prices = []
    shows.each do |show|
      show_prices = []
      show.performances.each do |performance|
        performance.tickets.each { |ticket| show_prices << ticket.price if ticket.price.present? }
      end
      show_mean = show_prices.inject{ |sum, el| sum + el }.to_f / show_prices.size
      array_prices << show_mean
    end
    price_mean = array_prices.inject{ |sum, el| sum + el }.to_f / array_prices.size
    price_mean
  end

  def price_mean_by_client(clients)
    array_prices = []
    clients.each do |client|
      client_prices = []
      client.reservations.each do |reservation|
        reservation.tickets.each { |ticket| client_prices << ticket.price if ticket.price.present? }
      end
      client_mean = client_prices.inject{ |sum, el| sum + el }.to_f / client_prices.size
      array_prices << client_mean
    end
    price_mean = array_prices.inject{ |sum, el| sum + el }.to_f / array_prices.size
    price_mean
  end

  def price_mean_by_cart(carts)
    array_prices = []
    carts.each do |cart|
      cart_prices = []
      cart.reservations.each do |reservation|
        reservation.tickets.each { |ticket| cart_prices << ticket.price if ticket.price.present? }
      end
      cart_mean = cart_prices.inject{ |sum, el| sum + el }.to_f / cart_prices.size
      array_prices << cart_mean
    end
    price_mean = array_prices.inject{ |sum, el| sum + el }.to_f / array_prices.size
    price_mean
  end
end
