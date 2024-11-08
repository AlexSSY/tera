import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="crypto-prices"
export default class extends Controller {
  static targets = ["item"]
  static values = { symbol: String }

  connect() {
    var symbolTargets = {}

    this.itemTargets.forEach((item) => {
      symbolTargets[item.dataset.symbol] = item
    })

    this.updatePrices(symbolTargets)
    // Update prices every 10 seconds
    setInterval(() => {
      this.updatePrices(symbolTargets)
    }, 10000)
  }

  async updatePrices(symbolTargets) {
    const pairs = Object.keys(symbolTargets)

    pairs.forEach((pair) => {
      fetch(`https://api.binance.com/api/v3/ticker/24hr?symbol=${pair.toLocaleUpperCase()}${this.symbolValue.toUpperCase()}`)
        .then(data => data.json())
        .then(data => {
          symbolTargets[pair].children[1].innerText = parseFloat(data.lastPrice).toFixed(2)
          var priceChangePercent = parseFloat(data.priceChangePercent).toFixed(2)
          symbolTargets[pair].children[2].innerText = priceChangePercent
          if (priceChangePercent > 0) {
            symbolTargets[pair].children[2].classList.remove("text-red-500")
            symbolTargets[pair].children[2].classList.add("text-green-500")
          } else {
            symbolTargets[pair].children[2].classList.remove("text-green-500")
            symbolTargets[pair].children[2].classList.add("text-red-500")
          }
          symbolTargets[pair].children[3].innerText = parseFloat(data.priceChange).toFixed(2)
        }).catch(error => console.log(error))
    })
  }
}
