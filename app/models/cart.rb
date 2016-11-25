class Cart < ActiveRecord::Base
  has_many :reservations

  def self.generate_hash(cart_id)
    cart = Cart.where(["id = ?", cart_id]).first
    unless cart.present?
      cart_params = {}
      cart_params["id"] = cart_id
      cart_params
    end
  end
end
