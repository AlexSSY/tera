class PagesController < ApplicationController
  def index
    @first_symbols = %i[ btc eth sol doge xrp ltc ]
    @second_symbol = :usdt
    @top_gainers = [ [ :btc, :usdt ], [ :eth, :usdt ], [ :xrp, :usdt ] ]
    @new_listings = [ [ :doge, :usdt ], [ :ltc, :usdt ], [ :trx, :usdt ] ]
    @slider = [
      "BusinessInsider.svg",
      "Coindesk.svg",
      "CoinEdition.svg",
      "CryptoDaily.svg",
      "CT.svg",
      "FinanceMagnates.svg",
      "Investing.svg",
      "Kasobu.svg",
      "SCMP.svg",
      "TIA.svg"
     ]
  end

  def terms
  end

  def privacy
  end

  def search
  end
end
