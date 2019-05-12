require 'pry'
class DataGemPortfolio::Category

  attr_accessor :name, :price, :availability, :url

  def self.today
    # Scrape
    self.scrape_category
  end

  def self.scrape_category
    all_items = []
    all_items << self.scrape_woot
    all_items << self.scrape_inverter
    all_items
  end

  def self.scrape_woot
    doc = Nokogiri::HTML(open("https://www.luminousindia.com/combo-deal/inverter-battery.html"))

    battery_deal = self.new
    battery_deal.name = doc.search("h2.product-name").first.inner_text
    battery_deal.price = doc.css("span#product-price-1260.price").inner_text.strip
    battery_deal.url = doc.css(".product-name").css("a").first.attr("href")
    battery_deal.availability = true
    battery_deal
    # binding.pry
  end

  def self.scrape_inverter
    doc = Nokogiri::HTML(open("https://theinverterstore.com/product/180-watt-pure-sine-power-inverter/"))

    inverter_deal = self.new
    inverter_deal.name = doc.search("h3.product-title").first.text.strip
    inverter_deal.price = doc.css("span.woocommerce-Price-amount").first.text
    inverter_deal.url = doc.css(".product-title").css("a").first.attr("href")
    inverter_deal.availability = true
    inverter_deal
    # binding.pry

  end
  
end