require "net/http"
require "json"

page = 0

while true do
  # Define the CoinGecko API endpoint
  page += 1
  url = URI("https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&page=#{page}")

  # Set up the GET request
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(url)

  # Execute the request and parse the response
  response = http.request(request)
  coins = JSON.parse(response.body)
  break if coins.length == 0

  # Loop through each coin and display the name, symbol (tag), and icon URL
  coins.each do |coin|
    name = coin["name"]
    symbol = coin["symbol"]
    icon_url = coin["image"]

    puts "Name: #{name}"
    puts "Symbol: #{symbol.upcase}"
    puts "Icon URL: #{icon_url}"
    puts "-" * 40
    coin = Coin.create(name: name, tag: symbol)
    coin.attach_icon_from_url(icon_url)
  end

  sleep 10
end
