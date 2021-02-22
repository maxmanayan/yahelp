# a resturuant looks like this
# res_data = {
#   id: INTEGER *MUST BE UNIQUE,
#   name: STRING,
#   location: {
#     city: STRING,
#     state: STRING,
#   },
#   delivery: BOOLEAN,
#   days_open: STRING *DAYS SEPERATED BY COMMAS(NO SPACES),
#   likes: INTEGER,
#   dishes: ARRAY OF OBJECTS/HASHES
#     { name: STRING, price: FLOAT, ingredients: ARRAY OF STRINGS },
#   ],
#   reviews: ARRAY OF HASHES [
#     {user_id: INTEGER *id of user object, rating: INTEGER 0-5}
#   ]
# }
user1 = {
  id: 1,
  name: "Tony",
}
user2 = {
  id: 2,
  name: "Sally",
}
res1 = {
  id: 1,
  name: "Spicy Thai",
  location: {
    city: "SLC",
    state: "UT",
  },
  delivery: true,
  days_open: "mon,tues,wed,thur,fri,sat,sun",
  likes: 1000,
  dishes: [
    { name: "Pad Thai", price: 10.25, ingredients: ["noodles", "peppers"] },
    { name: "Drunken Noodle", price: 9.25, ingredients: ["noodles", "chicken"] },
  ],
  reviews: [
    { user_id: 1, rating: 5 },
    { user_id: 2, rating: 3 },
  ],
}
res2 = {
  id: 2,
  name: "Albertos",
  location: {
    city: "SLC",
    state: "UT",
  },
  delivery: false,
  days_open: "mon,tues,wed,thur,fri,sat",
  likes: 500,
  dishes: [
    { name: "Tacos", price: 8.25, ingredients: ["tortilla", "carne"] },
    { name: "Quesadilla", price: 9.25, ingredients: ["tortilla", "cheese"] },
  ],
  reviews: [
    { user_id: 1, rating: 2 },
    { user_id: 2, rating: 4 },
  ],
}



# OBJECTIVES
# method w/ param restaurant, returns the menu of the param
# method param restaurant, return avg review
# create array of restaurant and do CRUD actions
# method to return address
# method to return days of operation
# method takes a restaurant and updates it to your array

@restaurants = [res1, res2]



# MENU METHOD W/ PARAM
def get_menu(res) 
  puts "~#{res[:name]}~ Menu"
  res[:dishes].each_with_index do |item, index|
    puts "#{index + 1}) #{item[:name]} #{item[:ingredients]} - $#{item[:price]}"
  end
  puts "..."
end



## ACCESS ALL MENUS
def all_menus
  @restaurants.each do |res|
    puts "~#{res[:name]}~ Menu"
    res[:dishes].each_with_index do |item, index|
      puts "#{index + 1}) #{item[:name]} #{item[:ingredients]} - $#{item[:price]}"
    end
    puts "..."
  end
end



# GET ONE REVIEW
def get_avg_review(res)
  puts "~#{res[:name]}~ Customer Ratings"
  nums = Array.new()
  res[:reviews].each do |rate|
    nums.push(rate[:rating].to_f)
  end
  result = nums.inject(0){|sum, rating| sum + rating} / nums.length
  puts "Average Rating: #{result}/5.0"
  puts "..."
end




## GET ALL REVIEWS
def all_avg_reviews
  @restaurants.each do |res|
    puts "~#{res[:name]}~ Customer Ratings"
    nums = Array.new()
    res[:reviews].each do |review|
      nums.push(review[:rating].to_f)
    end
    avg_rating = nums.inject(0){|sum, rating| sum + rating} / nums.length
    puts "Average Rating: #{avg_rating}/5.0"
    puts "..."
  end
end





## GET ONE ADDRESS
def get_address(res)
  puts "~#{res[:name]}~ Location"
  puts "#{res[:location][:city]},#{res[:location][:state]}"
  puts "..."
end



## GET ALL ADDRESSES
def all_addresses
  @restaurants.each do |res|
    puts "~#{res[:name]}~ Location"
    puts "#{res[:location][:city]},#{res[:location][:state]}"
    puts "..."
  end
end




## GET ONE RESTAURANT'S DAYS OPEN
def get_days_open(res)
  puts "~#{res[:name]}~ Days Open"
  days = res[:days_open].split(",").map(&:capitalize).join(", ")
  puts days
  puts "..."
end



## GET ALL RESTAURANT'S DAYS OPEN

def all_days_open
  @restaurants.each do |res|
    puts "~#{res[:name]}~ Days Open"
    days = res[:days_open].split(",").map(&:capitalize).join(", ")
    puts days
    puts "..."
  end
end





## SORT PRICES
## sorts prices of menus from cheapest to most expensive

def cheapest_first
  @restaurants.each do |res|
    puts "~#{res[:name]}~ Options in Order of Price"

    prices = res[:dishes].sort_by {|item| item[:price]}
    
    prices.each_with_index do |item, index|
      puts "#{index + 1}) #{item[:name]} #{item[:ingredients]} - $#{item[:price]}" 
    end
    puts "..."
  end
end




## BUDGET OPTIONS
## get average price of menu
## return restaurant if avg price < $9

def budget_options
  puts "Budget Options:"
  exist = false
  @restaurants.each do |res|
    prices = Array.new()
    res[:dishes].each do |dish|
      prices.push(dish[:price].to_f)
    end
    avg_price = prices.inject(0) {|sum, price| sum + price/ prices.length}
    if avg_price < 9.0 
      exist = true
      puts "~#{res[:name]}~"
      puts "The average price at #{res[:name]} is under $9.00!"
      puts "..."
    end
  end
  if exist == false
    puts "..."
    puts "No Budget Options Available"
    puts "..."
  end
end




## Find Likes > 500
## loop through restaurants
## return those with Likes > 500
def get_likes
  is_popular = @restaurants.select {|res|res[:likes] > 500}
  is_popular.each do |res|
    puts "~#{res[:name]}~ Popularity"
    puts "#{res[:name]} has over 500 likes!"
    puts "..."
  end
end





## LACTOSE INTOLERANT
## loop through restaurants-dishes-ingredients
## if cheese is in dish return "(restaurant name) has (number of dishes) with cheese: (dish name)""
def find_cheese
  puts "Lactose Intolerance Warning:"
  @restaurants.each do |res|
    res[:dishes].each do |dish|
      if dish[:ingredients].include? "cheese" 
        puts "~#{res[:name]}~ #{dish[:name]} contains cheese!"
      end
    end
  end
end




## FIND OUT IF RESTAURANT DELIVERS
## SELECT if delivery = true
## print new array

def has_delivery
  puts "~Delivery Options~"
  delivery = @restaurants.select {|res| res[:delivery] == true}
  delivery.each do |res|
    puts "#{res[:name]} has delivery!"
  end
  puts "..."
end



## CRUD OPERATIONS
## Create, read, update, delete
# a resturuant looks like this
# res_data = {
#   id: INTEGER *MUST BE UNIQUE,
#   name: STRING,
#   location: {
#     city: STRING,
#     state: STRING,
#   },
#   delivery: BOOLEAN,
#   days_open: STRING *DAYS SEPERATED BY COMMAS(NO SPACES),
#   likes: INTEGER,
#   dishes: ARRAY OF OBJECTS/HASHES
#     { name: STRING, price: FLOAT, ingredients: ARRAY OF STRINGS },
#   ],
#   reviews: ARRAY OF HASHES [
#     {user_id: INTEGER *id of user object, rating: INTEGER 0-5}
#   ]
# }

## Create a restaurant
def create_res(res ={})
  id = res.fetch(:id)
  name = res.fetch(:name)
  location = res.fetch(:location)
  delivery = res.fetch(:delivery)
  days_open = res.fetch(:days_open)
  likes = res.fetch(:likes)
  dishes = res.fetch(:dishes)
  reviews = res.fetch(:reviews)
  
  @restaurants.push(res)
end

create_res(res3 = {
  id: 54, 
  name: "Kim's", 
  location: {
    city: "SLC", 
    state: "UT",
  }, 
  delivery: true, 
  days_open: "tues,wed,thur,fri,sat",
  likes: 1100,
  dishes: [
    {name: "Gimbap", price: 3.75, ingredients: ["rice","seaweed"]},
    {name: "Mandu", price: 5.25, ingredients: ["flour","pork"]},
  ],
  reviews: [
    {user_id: 1, rating: 4},
    {user_id: 2, rating: 5},
  ],
  }
  )

  create_res(res4 = {
    id: 54, 
    name: "Italian Garden", 
    location: {
      city: "SLC", 
      state: "UT",
    }, 
    delivery: false, 
    days_open: "tues,wed,thur,fri,sat",
    likes: 400,
    dishes: [
      {name: "Lasagna", price: 13.75, ingredients: ["cheese","noodles"]},
      {name: "Chicken Parm", price: 17.25, ingredients: ["chicken","cheese"]},
    ],
    reviews: [
      {user_id: 1, rating: 2},
      {user_id: 2, rating: 5},
    ],
    }
    )

# puts @restaurants[3][:name]



# ## Read a restaurant
# def view_res(res)
#   puts "Name: #{res[:name]}"
#   puts "Location: #{res[:location][:city]}, #{res[:location][:state]}"
#   puts "Days Open: #{res[:days_open].split(",").map(&:capitalize).join(", ")}"
# end

# view_res(res)


# ## Update a restaurant
# def update_res(index,res)
#   @restaurants.delete_at(index)

#   @restaurants.insert(index,res)
# end


# update_res(2,res3 = {
#   id: 54, 
#   name: "Hot Dog!", 
#   location: {
#     city: "SLC", 
#     state: "UT",
#   }, 
#   delivery: false, 
#   days_open: "fri,sat,sun",
#   likes: 100,
#   dishes: [
#     {name: "Chili Dog", price: 4.25, ingredients: ["hotdog","chili"]},
#     {name: "Hot Dog", price: 2.75, ingredients: ["bread","hotdog"]},
#   ],
#   reviews: [
#     {user_id: 1, rating: 1},
#     {user_id: 2, rating: 2},
#   ],
#   }
#   )

# puts @restaurants


# ## Delete a restaurant
# def delete_res(res)
#   @restaurants.delete(res)
# end

# delete_res(res3)



### CALL METHODS BELOW HERE
# get_menu(res1)
# all_menus

# get_avg_review(res3)
# all_avg_reviews

# get_address(res2)
# all_addresses

# get_days_open(res2)
# all_days_open

# cheapest_first

# budget_options

# get_likes

# find_cheese

# has_delivery