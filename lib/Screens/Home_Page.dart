import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snap_food/Screens/RestaurantPage.dart';
import 'package:snap_food/components/Food.dart';
import 'package:snap_food/components/FoodListView.dart';
import 'package:snap_food/components/Food_Label.dart';
import 'package:snap_food/components/Restaurant.dart';
import 'package:snap_food/constants.dart';
import 'package:snap_food/components/User.dart';
class Home_page extends StatefulWidget {
  final User user;
  const Home_page({
    Key key,
    this.user,
  }) : super(key: key);
  @override
  _Home_pageState createState() => _Home_pageState(user);
}

class _Home_pageState extends State<Home_page> {
  User user;
  _Home_pageState(User user){
    this.user = user;
  }
  List restaurants = [
    Restaurant(
      name: 'restaurant1',
      image: Image(image: AssetImage('images/restaurants.jpg'),),
      Burger_List: [
        Food(name: "burger1", details: "2sikh fjskdfds ldfsd fsdif dsf", price: 5 , image: Image(image: AssetImage('images/pizza1.jpg'),),id: 0),
        Food(name: "burger2", details: "2sikh fjskdfds ldfsd fsdif dsf", price: 5 , image: Image(image: AssetImage('images/pizza1.jpg')),id: 0),
      ],
      Chinese_List: [
        Food(name: "burger1", details: "2sikh fjskdfds ldfsd fsdif dsf", price: 5 , image: Image(image: AssetImage('images/pizza1.jpg')),id: 0),
      ],
      Indian_List: [
        Food(name: "burger1", details: "2sikh fjskdfds ldfsd fsdif dsf", price: 5 , image: Image(image: AssetImage('images/pizza1.jpg')),id: 0),
      ],
      Kebab_List: [],
      Mexican_List: [],
      Pizza_List: [],
      Salad_List: [],
      Sandwich_List: [],
      Vegetarian_List: [],
    ),
    Restaurant(
      name: 'restaurant2',
      image: Image(image: AssetImage('images/restaurants.jpg'),),
      Burger_List: [
        Food(name: "burger3", details: "2sikh fjskdfds ldfsd fsdif dsf", price: 5 , image: Image(image: AssetImage('images/pizza1.jpg')),id: 1),
        Food(name: "burger4", details: "2sikh fjskdfds ldfsd fsdif dsf", price: 5 , image: Image(image: AssetImage('images/pizza1.jpg')),id: 1),
      ],
      Chinese_List: [
        Food(name: "burger1", details: "2sikh fjskdfds ldfsd fsdif dsf", price: 5 , image: Image(image: AssetImage('images/pizza1.jpg')),id: 1),
      ],
      Indian_List: [
        Food(name: "burger1", details: "2sikh fjskdfds ldfsd fsdif dsf", price: 5 , image: Image(image: AssetImage('images/pizza1.jpg')),id: 1),
      ],
      Kebab_List: [],
      Mexican_List: [],
      Pizza_List: [],
      Salad_List: [],
      Sandwich_List: [],
      Vegetarian_List: [],
    ),

  ];
  @override
  Widget build(BuildContext context) {
    List pizzas = [];
    List salads = [];
    List kebabs = [];
    List mexicans = [];
    List burgers = [];
    List sandwichs = [];
    List indians = [];
    List vegetarians = [];
    List chineses = [];
    for (Restaurant restaurant in restaurants){
      pizzas.addAll(restaurant.Pizza_List);
      salads.addAll(restaurant.Salad_List);
      kebabs.addAll(restaurant.Kebab_List);
      mexicans.addAll(restaurant.Mexican_List);
      burgers.addAll(restaurant.Burger_List);
      sandwichs.addAll(restaurant.Sandwich_List);
      indians.addAll(restaurant.Indian_List);
      vegetarians.addAll(restaurant.Vegetarian_List);
      chineses.addAll(restaurant.Chinese_List);
    }

    return DefaultTabController(
      length: 8,
      child: Scaffold(
        backgroundColor: Colors.grey[600],
        appBar: AppBar(
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                text: "BURGER",
              ),
              Tab(
                text: "PIZZA",
              ),
              Tab(
                text: "SALAD",
              ),
              Tab(
                iconMargin: EdgeInsets.all(30),
                text: "INDIAN",
              ),
              Tab(
                iconMargin: EdgeInsets.all(30),
                text: "KEBAB",
              ),
              Tab(
                iconMargin: EdgeInsets.all(30),
                text: "SANDWICH",
              ),
              Tab(
                iconMargin: EdgeInsets.all(30),
                text: "VEGETARIAN",
              ),
              Tab(
                iconMargin: EdgeInsets.all(30),
                text: "CHINESE",
              ),
            ],
          ),
          title: Text('Tabs Demo'),
        ),
        body: TabBarView(
          children: [
            FoodsListView(foods: burgers,restaurants: restaurants,user: user,ontab: true,),
            FoodsListView(foods: pizzas,restaurants: restaurants,user: user,ontab: true,),
            FoodsListView(foods: salads,restaurants: restaurants,user: user,ontab: true,),
            FoodsListView(foods: indians,restaurants: restaurants,user: user,ontab: true,),
            FoodsListView(foods: kebabs,restaurants: restaurants,user: user,ontab: true,),
            FoodsListView(foods: sandwichs,restaurants: restaurants,user: user,ontab: true,),
            FoodsListView(foods: vegetarians,restaurants: restaurants,user: user,ontab: true,),
            FoodsListView(foods: chineses,restaurants: restaurants,user: user,ontab: true,),
          ],
        ),
      ),
    );
  }}
