
require "nokogiri"
require "open-uri"

Ingredient.destroy_all

puts "Destroy database"

file = "https://www.joliessence.com/6-aromatherapie-et-phytotherapie?id_category=6&n=180"
doc = Nokogiri::HTML(open(file))
exists = []

puts "Create part 1"
urls = doc.search(".product-name")
urls.each do |url|
  list = url.attribute("href")
  if list
    product = Nokogiri::HTML(open(list))
    cl = product.search("h1")
    fulltitle = cl.text.split("-")
    if fulltitle.length == 1
      fulltitle = cl.text.split("(")
    end
    name = fulltitle[0].strip
    if !exists.include?(name)
      puts name
      al = product.search("#precautions")
      alert = ""
      if al.length > 0
        alert = al.first.next_element.search("li").text
      end
      unit = "n/a"
      if fulltitle[1]
        un = fulltitle[1].split("/")
        reg = un[0].match(/\d+( )?(?<unit>\w+)?/)
        if reg
        unit = reg[:unit]
        end
      end
      ingredient = Ingredient.new(name: name, alert: alert, unit: unit)
      ingredient.save!
      exists << name
    end
 end
end

puts "Part 1 finish"
puts "Create part 2"

file = "https://www.joliessence.com/3-ingredients-cosmetiques?id_category=3&n=120"
doc = Nokogiri::HTML(open(file))


urls = doc.search("a.product-name")
urls.each do |url|
  list = url.attribute("href")
  if list
    product = Nokogiri::HTML(open(list))
    cl = product.search("h1")
    fulltitle = cl.text.split("-")
    if fulltitle.length == 1
      fulltitle = cl.text.split("(")
    end
    name = fulltitle[0].strip
    puts name
    al = product.search("#precautions")
    alert = ""
    if al.length > 0
      alert = al.first.next_element.search("li").text
    end
    unit = "n/a"
    if fulltitle[1]
      un = fulltitle[1].split("/")
      reg = un[0].match(/\d+( )?(?<unit>\w+)?/)
      if reg
      unit = reg[:unit]
      end
    end

    ingredient = Ingredient.new(name: name, alert: alert, unit: unit)
    ingredient.save!
  end
end

puts "Part 2 finish"
puts "Database created"
