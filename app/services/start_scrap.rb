require 'open-uri'
require 'rubygems'
require 'nokogiri'

class StartScrap

  def initialize
    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    @name = page.css("a.currency-name-container.link-secondary")
    @price = page.css ("a.price")
    @crypto_name=[]
    @crypto_price=[]
  end

  def perform
    @name.each do |link|
      name = link.text
      @crypto_name << name
    end

    @price.each do |link|
      name = link.text
      @crypto_price << name
    end
    save
  end

  def save
    hash=Hash[@crypto_name.zip(@crypto_price)]
    return hash
 end
end
