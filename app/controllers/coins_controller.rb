class CoinsController < ApplicationController
  def index
    @pagy, @coins = pagy(Coin.all)
  end
end
