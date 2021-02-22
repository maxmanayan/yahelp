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



const restaurants = [res1, res2];



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
  let ratingArr = res.reviews.map((review)=>{return review.rating;})
  let avgRating = (ratingArr)=>ratingArr.reduce((sum,rating) => sum + rating) / ratingArr.length; 
  console.log(`${res.name} has an average rating of ${avgRating(ratingArr)}/5`)})
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





//// ADD NEW ITEM TO RESTAURANT ARRAY
function createRes (res = {}) {
  restaurants.push(res)
}

let res3 = {
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
};

let res4 = {
  id: 101, 
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
  };

createRes(res3);
createRes(res4);

console.log(restaurants);