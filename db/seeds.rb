require 'faker'

# default site settings:
SiteSetting.set :site_name, "Crypto Trade"
SiteSetting.set :facebook, "https://facebook.com"
SiteSetting.set :twitter, "https://twitter.com"
SiteSetting.set :instagram, "https://instagram.com"
SiteSetting.set :youtube, "https://youtube.com"
SiteSetting.set :linkedin, "https://linkedin.com"
SiteSetting.set :telegram, "https://telegram.com"
SiteSetting.set :tiktok, "https://tiktok.com"
SiteSetting.set :reddit, "https://reddit.com"
SiteSetting.set :discord, "https://discord.com"
SiteSetting.set :tradingview, "https://tradingview.com"
SiteSetting.set :google, "https://google.com"
SiteSetting.set :apple, "https://apple.com"
SiteSetting.set :change_24h_trading_volume, "5_00_000"
SiteSetting.set :cryptocurrencies_listed, "200"
SiteSetting.set :registered_users, "100_000"
SiteSetting.set :supported_countries, "150"
SiteSetting.set :news, [
  "Bybit Daily Delight: Year-End Sprint – Check In and Spin for Daily Treats!",
  "[SEA Exclusive] Win an Exclusive Labubu and Your Share of $100,000",
  "🚀Bitcoin Hits a New All-Time High: Predict & Win 20 USDT!",
  "Token Clash: Blue Chip vs. Memecoin — Vote to Share 200,000 USDT",
  "Bybit Monster Treats: Snag Your Slice of $130,000 in Rewards!"
].join("\n")

# some fake users:
100.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.unique.email,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number,
    password: 'password123' # You can use Faker::Internet.password(min_length: 8) for random passwords
  )
end
