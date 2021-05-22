import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snap_food/components/Food.dart';
import 'package:snap_food/components/FoodListView.dart';
import 'package:snap_food/components/Food_Label.dart';
import 'package:snap_food/components/Restaurant.dart';
import 'package:snap_food/components/User.dart';
import 'package:snap_food/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Restaurant_page extends StatefulWidget {
  final List restaurants;
  final User user;
  final Restaurant restaurant;
  const Restaurant_page({
    Key key,
    this.restaurants,
    this.user,
    this.restaurant,
  }) : super(key: key);
  @override
  _Restaurant_pageState createState() => _Restaurant_pageState(user, restaurant,restaurants);
}

class _Restaurant_pageState extends State<Restaurant_page> {
  List restaurants;
  Restaurant restaurant;
  User user;
  var LikeIcon;
  bool isLike;
  _Restaurant_pageState(User user, Restaurant restaurant, List restaurants){
    this.restaurants = restaurants;
    this.user = user;
    this.restaurant = restaurant;
    isLike = user.favoriteRestaurants.contains(restaurant)?true:false;
    LikeIcon = user.favoriteRestaurants.contains(restaurant)? FaIcon(FontAwesomeIcons.solidHeart,color: Colors.red,):FaIcon(FontAwesomeIcons.heart,);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: SingleChildScrollView(
        child: Container(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                  ),

                  height: 200,
                  width: double.infinity,
                    child: FittedBox(
                      child: restaurant.image,
                      fit: BoxFit.fill,
                    ),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20,right: 10,top: 10),
                            child: Text(restaurant.name,
                              style: restaurantTitleStyle,
                            ) ,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 13, left: 10),
                          padding: EdgeInsets.all(10),
                          color: Colors.grey[400],
                          child: Row(
                            children: [
                              Icon(
                                Icons.comment,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text('comments',
                                style: TextStyle(
                                  fontSize: 20,
                                ),),
                            ],
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.star,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(restaurant.score.toString(),
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                              ),),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            IconButton(
                              icon : LikeIcon,
                              onPressed: (){
                                setState(() {
                                  if (isLike == true){
                                    LikeIcon = FaIcon(FontAwesomeIcons.heart,
                                    );
                                  }
                                  else{
                                    LikeIcon = FaIcon(FontAwesomeIcons.solidHeart,color: Colors.red,);
                                  }
                                  isLike = !isLike;
                                  if (!user.favoriteRestaurants.contains(restaurant))
                                    user.favoriteRestaurants.add(this.restaurant);
                                  else{
                                    user.favoriteRestaurants.remove(this.restaurant);
                                  }
                                  print(user.favoriteRestaurants);


                                });
                              },
                            ),

                            Text('add to favorite',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                Container(
                 child: DefaultTabController(
                      length: 5, // length of tabs
                      initialIndex: 0,
                      child:
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                        Container(
                          child: TabBar(
                            isScrollable: true,
                            labelColor: Colors.green,
                            unselectedLabelColor: Colors.black,
                            tabs: [
                              Tab(
                                text: "FAVORITE FOOD",
                              ),
                              Tab(
                                text: "FOOD",
                              ),
                              Tab(
                                text: "SALAD",
                              ),
                              Tab(
                                iconMargin: EdgeInsets.all(30),
                                text: "VEGETARIAN",
                              ),
                              Tab(
                                iconMargin: EdgeInsets.all(30),
                                text: "DRINK",
                              ),
                            ],
                          ),
                        ),
                        Container(
                            height: 400, //height of TabBarView
                            decoration: BoxDecoration(
                                border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
                            ),
                            child: Container(
                              color: Colors.grey[600],
                              child: TabBarView(
                                  children: <Widget>[
                                FoodsListView(foods: restaurant.favoriteFoodList,user: user,restaurant: restaurant,),
                                    FoodsListView(foods: restaurant.foodList,user: user,restaurant: restaurant,),
                                    FoodsListView(foods: restaurant.saladList,user: user,restaurant: restaurant,),
                                    FoodsListView(foods: restaurant.vegetarianList,user: user,restaurant: restaurant,),
                                    FoodsListView(foods: restaurant.drinkList,user: user,restaurant: restaurant,),
                                    ]),
                            )
                        )
                      ])
                  ),
                ),
              ],
            ),

          ),
      ),
    );
  }}


