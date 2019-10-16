require "nokogiri"
require "open-uri"
require "pp"
require "pry"
require "net/http"

def get_townhall_urls(main_url)

  page = Nokogiri::HTML(open(main_url))
  response_code = Net::HTTP.get_response(URI(main_url)).code
  puts response_code # print http status code

  all_townhall_urls = page.xpath("//a[@class='lientxt']/@href")
  all_townhall_names = page.xpath("//a[@class='lientxt']")

  all_townhall_urls = all_townhall_urls.map {|url| url.text }
  all_townhall_names = all_townhall_names.map {|name| name.text }

  return all_townhall_names, all_townhall_urls
end

def get_emails(all_townhalls_urls)
 
  emails = []

  all_townhalls_urls.each do |url|
    page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/#{url.to_s.slice!(2..-1)}"))
    current_email = page.xpath('/html/body/div[1]/main/section[2]/div/table/tbody/tr[4]/td[2]')
    current_email = current_email.text
    emails << current_email
  end

  return emails

end

def perform
  all_townhall_names, all_townhalls_urls = get_townhall_urls('https://www.annuaire-des-mairies.com/val-d-oise.html')
  emails = get_emails(all_townhalls_urls)
  result = []
  emails.length.times { |index| result << {all_townhall_names[index] => emails[index]} }
  return result
end

pp perform
