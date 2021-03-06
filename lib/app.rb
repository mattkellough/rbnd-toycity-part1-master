require 'json'
path = File.join(File.dirname(__FILE__), '../data/products.json')
file = File.read(path)
products_hash = JSON.parse(file)

# Print today's date
require 'date'
puts ''
puts "Today's Date: " + Date.today.strftime("%m/%d/%Y")

puts "                     _            _       "
puts "                    | |          | |      "
puts " _ __  _ __ ___   __| |_   _  ___| |_ ___ "
puts "| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|"
puts "| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\"
puts "| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
puts "| |                                       "
puts "|_|                                       "

puts ''
brands = []

# For each product in the data set:
products_hash["items"].each do |toy|
  brands.push(toy["brand"]) unless brands.include? toy["brand"]

  # Print the name of the toy
  puts "#{toy["title"]}"
  puts '****************************************'
  # Print the retail price of the toy
  retail = toy["full-price"].to_f
  puts "Retail Price: $#{retail}"
  # Calculate and print the total number of purchases
  amt_purchases = toy["purchases"].length
  puts "Purchases: #{amt_purchases}"
  # Calculate and print the total amount of sales
  revenue = 0.0
  toy["purchases"].each do |purchases|
    revenue = revenue + purchases["price"]
  end
  puts "Sales: $#{revenue}"
  # Calculate and print the average price the toy sold for
  avg_price = revenue / amt_purchases
  puts "Average Price: $#{avg_price}"
  # Calculate and print the average discount (% or $) based off the average sales price
  retail_value = retail * amt_purchases
  average_price = (retail_value - revenue)/amt_purchases
  average_price = average_price
  puts "Average Discount: $#{"%.2f" % average_price}"
  puts '****************************************'
  puts ''
end



puts " _                         _     "
puts "| |                       | |    "
puts "| |__  _ __ __ _ _ __   __| |___ "
puts "| '_ \\| '__/ _` | '_ \\ / _` / __|"
puts "| |_) | | | (_| | | | | (_| \\__ \\"
puts "|_.__/|_|  \\__,_|_| |_|\\__,_|___/"
puts

puts ''

# For each brand in the data set:
brands.each do |brand|
  # Print the name of the brand
  # brand_name = brand["brand"]
  puts "#{brand.upcase}"
  puts '****************************************'


  these_products = products_hash["items"].select { |item| item["brand"] == brand }
  toys = these_products.length


  # Count and print the number of the brand's toys we stock
  brand_stock = 0
  brand_price = 0.0
  these_products.each do |brand|
    brand_stock = brand_stock + brand["stock"]
    brand_price = brand_price + brand["full-price"].to_f
  end
  puts "Number of Products: #{brand_stock}"
  # Calculate and print the average price of the brand's toys
  avg_brand_price = brand_price / toys
  puts "Average Product Price: $#{avg_brand_price.round(2)}"
  # Calculate and print the total revenue of all the brand's toy sales combined
  brand_revenue = 0.0
  these_products.each do |brand|
    brand["purchases"].each do |purchases|
      brand_revenue = brand_revenue + purchases["price"]
    end
  end
  puts "Total sales: $#{brand_revenue.round(2)}"
  puts ''
end
