import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snap_food/components/Food.dart';
import 'package:snap_food/components/Food_Label.dart';
import 'package:snap_food/components/Restaurant.dart';
import 'package:snap_food/components/User.dart';

const cardstyle = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.w900,
);
const kLoginTitle = TextStyle(
  fontFamily: 'Lobster',
  fontSize: 25.0,
  fontWeight: FontWeight.w700,
  letterSpacing: 3.0,
);
const kGenderStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700
);
const restaurantTitleStyle = TextStyle(
  fontWeight: FontWeight.w900,
  fontSize: 30,
  letterSpacing: 1.5,
);
const textStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w800,
  letterSpacing: 1.6,
);
const restaurantListStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w900,
  letterSpacing: 1.6,
);
List AllRestaurants = [
  Restaurant(
    name: 'Restaurant A',
    image: Image(
      image: AssetImage('images/restaurants.jpg'),
    ),
    label: RestaurantLabel.BURGER,
    discount: 20,
    foodList: [
      Food(
          name: 'Burger1',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
      Food(
          name: 'Burger2',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
      Food(
          name: 'Burger3',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
      Food(
          name: 'Burger4',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
    ],
    saladList: [
      Food(
          name: 'salad1',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
      Food(
          name: 'salad2',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
      Food(
          name: 'salad3',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
      Food(
          name: 'salad4',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
    ],
    vegetarianList: [
      Food(
          name: 'veg1',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
      Food(
          name: 'veg2',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
    ],
    drinkList: [
      Food(
          name: 'drink1',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
    ],
  ),
  Restaurant(
    name: 'Restaurant D',
    image: Image(
      image: AssetImage('images/restaurants.jpg'),
    ),
    label: RestaurantLabel.BURGER,
    discount: 20,
    foodList: [
      Food(
          name: 'Burger1',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
      Food(
          name: 'Burger2',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
      Food(
          name: 'Burger3',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
      Food(
          name: 'Burger4',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
    ],
    saladList: [
      Food(
          name: 'salad1',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
      Food(
          name: 'salad2',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
      Food(
          name: 'salad3',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
      Food(
          name: 'salad4',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
    ],
    vegetarianList: [
      Food(
          name: 'veg1',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
      Food(
          name: 'veg2',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
    ],
    drinkList: [
      Food(
          name: 'drink1',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
    ],
  ),
  Restaurant(
    name: 'Restaurant E',
    image: Image(
      image: AssetImage('images/restaurants.jpg'),
    ),
    label: RestaurantLabel.BURGER,
    discount: 20,
    foodList: [
      Food(
          name: 'Burger1',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
      Food(
          name: 'Burger2',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
      Food(
          name: 'Burger3',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
      Food(
          name: 'Burger4',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
    ],
    saladList: [
      Food(
          name: 'salad1',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
      Food(
          name: 'salad2',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
      Food(
          name: 'salad3',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
      Food(
          name: 'salad4',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
    ],
    vegetarianList: [
      Food(
          name: 'veg1',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
      Food(
          name: 'veg2',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
    ],
    drinkList: [
      Food(
          name: 'drink1',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
    ],
  ),
  Restaurant(
    name: 'Restaurant F',
    image: Image(
      image: AssetImage('images/restaurants.jpg'),
    ),
    label: RestaurantLabel.BURGER,
    discount: 20,
    foodList: [
      Food(
          name: 'Burger1',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
      Food(
          name: 'Burger2',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
      Food(
          name: 'Burger3',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
      Food(
          name: 'Burger4',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
    ],
    saladList: [
      Food(
          name: 'salad1',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
      Food(
          name: 'salad2',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
      Food(
          name: 'salad3',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
      Food(
          name: 'salad4',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
    ],
    vegetarianList: [
      Food(
          name: 'veg1',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
      Food(
          name: 'veg2',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
    ],
    drinkList: [
      Food(
          name: 'drink1',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
    ],
  ),
  Restaurant(
    name: 'Restaurant B',
    image: Image(
      image: AssetImage('images/restaurants.jpg'),
    ),
    label: RestaurantLabel.BURGER,
    discount: 20,
    foodList: [
      Food(
          name: 'Burger11',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
      Food(
          name: 'Burger22',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
      Food(
          name: 'Burger33',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
      Food(
          name: 'Burger44',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
    ],
    saladList: [
      Food(
          name: 'salad11',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
      Food(
          name: 'salad22',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
      Food(
          name: 'salad33',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
      Food(
          name: 'salad44',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
    ],
    vegetarianList: [
      Food(
          name: 'veg11',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
      Food(
          name: 'veg22',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
    ],
    drinkList: [
      Food(
          name: 'drink11',
          details: 'burger fsf sfsdffs fsdfs',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 10),
    ],
  ),
  Restaurant(
    name: 'Restaurant C',
    image: Image(
      image: AssetImage('images/restaurants.jpg'),
    ),
    foodList: [
      Food(
          name: 'pizza1',
          details: 'dk;alsdksa;ld dls;akdas',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 20),
      Food(
          name: 'pizza2',
          details: 'dk;alsdksa;ld dls;akdas',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 20),
      Food(
          name: 'pizza2',
          details: 'dk;alsdksa;ld dls;akdas',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 20),
      Food(
          name: 'pizza4',
          details: 'dk;alsdksa;ld dls;akdas',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 20),
    ],
    saladList: [
      Food(
          name: 'salad1',
          details: 'dk;alsdksa;ld dls;akdas',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 20),
      Food(
          name: 'salad2',
          details: 'dk;alsdksa;ld dls;akdas',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 20),
    ],
    vegetarianList: [
      Food(
          name: 'veg1',
          details: 'dk;alsdksa;ld dls;akdas',
          image: Image(
            image: AssetImage('images/pizza1.jpg'),
          ),
          price: 20),
    ],
    drinkList: [
      Food(
          name: 'drink1',
          details: 'dk;alsdksa;ld dls;akdas',
          image: Image(
            image: AssetImage('pizza1.jpg'),
          ),
          price: 20),
    ],
    label: RestaurantLabel.PIZZA,
  )
];
var tabBar = TabBar(
  isScrollable: true,
  tabs: [
    Tab(
      text: "BURGER",
    ),
    Tab(
      text: "PIZZA",
    ),
    Tab(
      text: "MEXICAN",
    ),
    Tab(
      text: "INDIAN",
    ),
    Tab(
      text: "IRANIAN",
    ),
    Tab(
      text: "SANDWICH",
    ),
    Tab(
      text: "CHINESE",
    ),
  ],
);

