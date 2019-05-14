require 'pry'
class DataGemPortfolio::Category
  attr_accessor :name, :price, :availability, :url

  def self.today
    self.scrape_category
  end

  def self.scrape_category
    all_items = []
    all_items << self.scrape_woot
    all_items << self.scrape_inverter
    all_items << self.scrape_solar
    all_items
  end

  def self.batteries
    doc = Nokogiri::HTML(open("https://www.luminousindia.com/combo-deal/inverter-battery.html"))
  end

  def self.scrape_woot
    battery_deal = self.new
    battery_deal.name = self.batteries.search("h2.product-name").first.inner_text
    battery_deal.price = self.batteries.css("span#product-price-1260.price").inner_text.strip
    battery_deal.url = self.batteries.css(".product-name").css("a").first.attr("href")
    battery_deal.availability = true
    battery_deal
  end
  
  def self.inverters
      doc = Nokogiri::HTML(open("https://theinverterstore.com/product/180-watt-pure-sine-power-inverter/"))
  end
  def self.scrape_inverter
    inverter_deal = self.new
    inverter_deal.name = self.inverters.search("h3.product-title").first.text.strip
    inverter_deal.price = self.inverters.css("span.woocommerce-Price-amount").first.text
    inverter_deal.url = self.inverters.css(".product-title").css("a").first.attr("href")
    inverter_deal.availability = true
    inverter_deal
  end
  
  def self.solar
    doc = Nokogiri::HTML(open("https://www.wholesalesolar.com/specials/"))
  end
  def self.scrape_solar
    solar_deal = self.new
    solar_deal.name = self.solar.search(".prod-td").css(".product-row-link").first.text
    solar_deal.price = self.solar.css(".price-group .price").first.text
    solar_deal.url = self.solar.css(".product-row-link").css("a").first.attr("href")
    solar_deal.availability = true
    solar_deal
  end
  # binding.pry
end
