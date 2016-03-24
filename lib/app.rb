require 'json'
path = File.join(File.dirname(__FILE__), '../data/products.json')
file = File.read(path)
products_hash = JSON.parse(file)

# Print today's date
require 'date'
puts "Today's Date: " + Date.today.strftime("%m/%d/%Y")

puts "                     _            _       "
puts "                    | |          | |      "
puts " _ __  _ __ ___   __| |_   _  ___| |_ ___ "
puts "| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|"
puts "| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\"
puts "| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
puts "| |                                       "
puts "|_|                                       "


# For each product in the data set:
products_hash["items"].each do |toy|
  # Print the name of the toy
  puts "#{toy["title"]}"
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
end


puts " _                         _     "
puts "| |                       | |    "
puts "| |__  _ __ __ _ _ __   __| |___ "
puts "| '_ \\| '__/ _` | '_ \\ / _` / __|"
puts "| |_) | | | (_| | | | | (_| \\__ \\"
puts "|_.__/|_|  \\__,_|_| |_|\\__,_|___/"
puts

# For each brand in the data set:
# Print the name of the brand
# Count and print the number of the brand's toys we stock
# Calculate and print the average price of the brand's toys
# Calculate and print the total revenue of all the brand's toy sales combined
