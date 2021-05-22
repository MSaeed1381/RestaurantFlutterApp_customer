import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:snap_food/Screens/RestaurantPage.dart';
import 'package:snap_food/components/Food.dart';
import 'package:snap_food/components/FoodListView.dart';
import 'package:snap_food/components/Food_Label.dart';
import 'package:snap_food/components/Restaurant.dart';
import 'package:snap_food/components/RestaurantListView.dart';
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
  List restaurants = AllRestaurants;
  List items = [];
  Icon cusIcon = Icon(Icons.search);
  Widget cusTitle = Text('snap food');
  PreferredSizeWidget cusTabBar = tabBar;
  @override
  Widget build(BuildContext context) {
    List pizzaRst = [];
    List iranianRst = [];
    List mexicanRst = [];
    List burgerRst = [];
    List sandwichRst = [];
    List indianRst = [];
    List chineseRst = [];
    for (Restaurant restaurant in restaurants){
      switch(restaurant.label){
        case RestaurantLabel.BURGER : burgerRst.add(restaurant);break;
        case RestaurantLabel.KEBAB : iranianRst.add(restaurant);break;
        case RestaurantLabel.PIZZA : pizzaRst.add(restaurant);break;
        case RestaurantLabel.SANDWICH : sandwichRst.add(restaurant);break;
        case RestaurantLabel.INDIAN : indianRst.add(restaurant);break;
        case RestaurantLabel.MEXICAN : mexicanRst.add(restaurant);break;
        case RestaurantLabel.CHINESE : chineseRst.add(restaurant);
      }
    }

    return DefaultTabController(
      length: 7,
      child: Scaffold(
        backgroundColor: Colors.grey[600],
        appBar: AppBar(
          leading: Icon(Icons.format_align_justify_outlined),
          actions: [
            IconButton(
              onPressed: (){
                items.clear();
                setState(() {
                  if (this.cusIcon.icon == Icons.search){
                    cusTabBar = null;
                    cusIcon = Icon(Icons.cancel_outlined);
                    cusTitle = TextFormField(
                    onChanged: (value){
                      setState(() {
                        if (value.isEmpty){
                          items.clear();
                        }
                        else{
                          items.clear();
                          print(value);
                          restaurants.forEach((element) {
                            if (element.name.toString().toLowerCase().contains(value.toLowerCase())){
                                items.add(element);
                            }
                          });
                        }
                      });

                    },
                    decoration: InputDecoration(

                      hintText: 'search...',
                    ),
                    );
                  }

                  else{
                    cusTabBar = tabBar;
                    cusIcon = Icon(Icons.search);
                    cusTitle = Text('snap food');
                  }

                });
              },
              icon: cusIcon,
            ),
            IconButton(
              icon: Icon(
                Icons.more_vert,
              ),
            ),
          ],
          bottom: cusTabBar,

          title: cusTitle,
        ),
        body: (cusTabBar == null)?
        Container(
          child: RestaurantListView(restaurants: items, user: user,),
        ) :
        TabBarView(
          children: [
            RestaurantListView(restaurants: burgerRst,user: user),
            RestaurantListView(restaurants: pizzaRst,user: user),
            RestaurantListView(restaurants: mexicanRst,user: user),
            RestaurantListView(restaurants: indianRst,user: user),
            RestaurantListView(restaurants: iranianRst,user: user),
            RestaurantListView(restaurants: sandwichRst,user: user),
            RestaurantListView(restaurants: chineseRst,user: user),
          ],
        ),
      ),
    );
  }}
