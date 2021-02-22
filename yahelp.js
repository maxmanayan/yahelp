// a resturuant looks like this
// res_data = {
//   id: INTEGER *MUST BE UNIQUE,
//   name: STRING,
//   location: {
//     city: STRING,
//     state: STRING,
//   },
//   delivery: BOOLEAN,
//   days_open: STRING *DAYS SEPERATED BY COMMAS(NO SPACES),
//   likes: INTEGER,
//   dishes: ARRAY OF OBJECTS/HASHES
//     { name: STRING, price: FLOAT, ingredients: ARRAY OF STRINGS },
//   ],
//   reviews: ARRAY OF HASHES [
//     {user_id: INTEGER *id of user object, rating: INTEGER 0-5}
//   ]
// }
let user1 = {
  id: 1,
  name: "Tony",
};
let user2 = {
  id: 2,
  name: "Sally",
};
let res1 = {
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
};
let res2 = {
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
};


// OBJECTIVES
// method w/ param restaurant, returns the menu of the param
// method param restaurant, return avg review
// create array of restaurant and do CRUD actions
// method to return address
// method to return days of operation
// method takes a restaurant and updates it to your array


const restaurants = [res1, res2];


// console.log(restaurants);

// // // BASIC METHOD FORMAT
// const return_restaurants = () => {
//   return restaurants;
// };

// console.log(return_restaurants());

// let res_name = restaurants.forEach = () => {
//   console.log("Hello World")
// }

// console.log(res_name)

////GET ONE RESTAURANT'S MENU
function getMenu (res) {
  console.log(`~${res.name}~ Menu`)
  res.dishes.forEach((dish, index)=>{
    console.log(`${index + 1}) ${dish.name} (${dish.ingredients}) - $${dish.price}`)
})
  console.log("")
};


getMenu(res2);



//// GET ALL RESTAURANTS' MENU
function allMenus () {restaurants.forEach((res) => {
  console.log(`~${res.name}~ Menu`)
  res.dishes.forEach((dish, index)=>{
    console.log(`${index + 1}) ${dish.name} (${dish.ingredients}) - $${dish.price}`)
    
  })
  console.log("")
})};

allMenus();



//// RETURN ADDRESS OF ONE RESTAURANT
function getAddress (res) {
  console.log(`~${res.name}~ Location`)
  console.log(`${res.location.city}, ${res.location.state}`)
  console.log("")
}

getAddress(res1)

////RETURN ADDRESS OF ALL RESTAURANTS
function allAddresses () {restaurants.forEach((res) => {
  console.log(`~${res.name}~ Location`)
  console.log(`${res.location.city}, ${res.location.state}`)
  console.log("")
  })
};

allAddresses();



//// RETURN AVERAGE REVIEWS OF A RESTAURANT
//// LOOP THROUGH RESTAURANTS RATINGS,
//// GET AVERAGE RATING
function allRatings () {
  console.log(`~Customer Ratings~`);
  restaurants.forEach((res)=>{
  let rating_arr = res.reviews.map((review)=>{return review.rating;})
  let avg_rating = (rating_arr)=>rating_arr.reduce((sum,rating) => sum + rating) / rating_arr.length; 
  console.log(`${res.name} has an average rating of ${avg_rating(rating_arr)}/5`)})
  console.log("")
}


allRatings()

//// RETURN RESTAURANTS WITH LIKES > 500
//// LOOP THROUGH RESTAURANTS
//// SELECT IF RESTAURANT LIKES > 500
function getLikes () {restaurants.filter((res)=>{
  if (res.likes > 500){
    console.log("~List of Best Restaurants~")
    console.log(`${res.name} is popular!`)}
    console.log("")
})};

getLikes();