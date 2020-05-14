class Lunch
  attr_accessor :main_dish, :price, :side_dish

  def initialize
    @main_dish 
    @price = 0
    @side_dish = Array.new
  end

  def add_main_dish(main_dish)
    @main_dish = main_dish[:name]
    @price += main_dish[:price]
  end

  def add_side_dish(side_dish)
    @side_dish << side_dish
    @price += side_dish[:price]
  end

  def repeat_order
    puts "Here's your order: #{@main_dish} with a side of #{@side_dish.at(0)[:name]} and #{@side_dish.at(1)[:name]}."
    puts "Total Price: " + sprintf("$%2.2f", @price)
  end

end



def main_dish_menu(user_lunch)
  pizza = {name: "Pizza", price: 6.00}
  hamburger = {name: "Hamburger", price: 7.50}
  chicken_nuggets = {name: "Chicken Nuggets", price: 8.00}
  
  puts "...Main Dish Lunch Menu..."
  puts "*Includes 2 sides"
  puts "1. Pizza --- $6.00"
  puts "2. Hamburger --- $7.50"
  puts "3. Chicken Nuggets --- $8.00"
  puts
  print ">"
  input = gets.strip
  case input
  when '1'
    puts "Pizza added to order. Please choose 2 sides."
    user_lunch.add_main_dish(pizza)
    side_dish_menu(user_lunch)
    puts "Please choose another side for your order"
    side_dish_menu(user_lunch)
  when '2'
    user_lunch.add_main_dish(hamburger)
    side_dish_menu(user_lunch)
    puts "Please choose another side for your order"
    side_dish_menu(user_lunch)
  when '3'
    user_lunch.add_main_dish(chicken_nuggets)
    side_dish_menu(user_lunch)
    puts "Please choose another side for your order"
    side_dish_menu(user_lunch)
  else
    puts "Invalid Response, please try again.\n"
  end
end

def side_dish_menu(user_lunch)
  chefs_salad =  {name: "Chef's Salad", price: 3.25}
  chicken_soup = {name: "Chicken Soup", price: 2.75}
  french_fries =  {name: "French Fries", price: 1.30}

  puts "...Side Dish Lunch Menu..."
  puts "1. Chef's Salad"
  puts "2. Chicken Soup"
  puts "3. French Fries" 
  puts
  print ">"
  input = gets.strip
  case input
  when '1'
    puts "Chef's Salad added to order!"
    user_lunch.add_side_dish(chefs_salad)
  when '2'
    puts "Chicken Soup added to order!"
    user_lunch.add_side_dish(chicken_soup)

  when '3'
    puts "French Fries added to order!"
    user_lunch.add_side_dish(french_fries)
    
  else
    puts "Invalid Response, please try again.\n"
  end
end
  
order = Lunch.new()
main_dish_menu(order)
order.repeat_order