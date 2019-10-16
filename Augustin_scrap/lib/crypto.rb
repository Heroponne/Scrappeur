require "nokogiri"
require "open-uri"
require "pp"

def get_cryto(url)
  page = Nokogiri::HTML(open(url))
  all_crypto_names = page.xpath('//td[3]')
  all_crypto_names = all_crypto_names.map {|name| name.text }


  all_crypto_prices = page.xpath('//td[5]/a')
  all_crypto_prices = all_crypto_prices.map {|price| price.text.delete('$').to_f }
  # all_crypto_prices = all_crypto_prices.map {|price| price.text.to_s.slice!(1..-1).to_f }

  result = []
  all_crypto_names.length.times { |index| result << {all_crypto_names[index] => all_crypto_prices[index]} }
  return result
end


pp get_cryto("https://coinmarketcap.com/all/views/all/")