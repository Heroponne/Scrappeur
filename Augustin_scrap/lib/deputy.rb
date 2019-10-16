require "nokogiri"
require "open-uri"
require "pp"

def get_deputy_emails(url)
  page = Nokogiri::HTML(open(url))
  all_deputy_names = page.xpath("//*[@class='titre_normal']")
  all_deputy_names = all_deputy_names.map {|deputy_name| deputy_name.text }

  all_deputy_emails = page.xpath("//*[@class='ann_mail']")
  all_deputy_emails = all_deputy_emails .map {|deputy_email| deputy_email.text }
                                        .select { |deputy_email| deputy_email.include?('@assemblee-nationale.fr') && !deputy_email.include?('secretariat') && !deputy_email.include?('bureau-m-orphelin@assemblee-nationale.fr')}

  deputy_infos = []
  all_deputy_names.length.times { |index| deputy_infos << {all_deputy_names[index] => all_deputy_emails[index]} }
  result = deputy_infos.map { |element| element.map { |key,value| {'first_name' => key.split(' ')[1], 'last_name' => key.split(' ')[2..-1].join(' '), 'email' => value } }}
  return result.flatten!
end

pp get_deputy_emails('https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=580')
