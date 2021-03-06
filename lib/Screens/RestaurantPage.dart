import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snap_food/Screens/CommentScreen.dart';
import 'package:snap_food/components/Comment.dart';
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
  List allFoods = [];
  List items = [];
  var LikeIcon;
  var cusIcon = Icon(Icons.search);
  bool isLike;
  var cusTitle;
  String commentsNumber;
  _Restaurant_pageState(User user, Restaurant restaurant, List restaurants){
    this.restaurants = restaurants;
    this.user = user;
    this.restaurant = restaurant;
    isLike = user.favoriteRestaurants.contains(restaurant)?true:false;
    LikeIcon = user.favoriteRestaurants.contains(restaurant)? FaIcon(FontAwesomeIcons.solidHeart,color: Colors.red,):FaIcon(FontAwesomeIcons.heart,);
    cusTitle = Text(restaurant.name);
    allFoods.addAll(restaurant.foodList);
    allFoods.addAll(restaurant.drinkList);
    allFoods.addAll(restaurant.vegetarianList);
    allFoods.addAll(restaurant.saladList);
    commentsNumber = restaurant.comments.length.toString();
  }

  change(String newNumber){
    setState(() {
      commentsNumber = newNumber;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: cusTitle,
        actions: [
          IconButton(
            onPressed: (){
              items.clear();
              setState(() {
                if (this.cusIcon.icon == Icons.search){
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
                          allFoods.forEach((element) {
                            if (element.name.toString().toLowerCase().contains(value.toLowerCase())){
                              items.add(element);
                            }
                          });
                        }
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      hintStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                }
                else{
                  cusIcon = Icon(Icons.search);
                  cusTitle = Text(restaurant.name);
                }
              });
            },
            icon: cusIcon,
          ),
          IconButton(
            onPressed: (){
              showDialog(
                  context: context,
                  builder: (_) {
                    return SimpleCustomAlert(restaurant: restaurant,user: user,function: change,);
                  });
            },
            icon: Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: (cusIcon.icon != Icons.search)?
          Container(
            color: Colors.grey[600],
           child: FoodsListView(foods: items,user: user,restaurant: restaurant,),
          ):
      SingleChildScrollView(
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
                        SizedBox(
                          width: 90,
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => CommentScreen(restaurant: restaurant,)));
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 13, left: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.comment,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(commentsNumber,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),),
                              ],
                            ),
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
  }
}
class SimpleCustomAlert extends StatefulWidget {
  final function;
  final User user;
  final Restaurant restaurant;
  const SimpleCustomAlert({
    Key key,
    this.restaurant,
    this.user,
    this.function
  }) : super(key: key);
  @override
  _SimpleCustomAlertState createState() => _SimpleCustomAlertState(restaurant, user, function);
}

class _SimpleCustomAlertState extends State<SimpleCustomAlert> {
  var _formKey = GlobalKey<FormState>();
  User user;
  Restaurant restaurant;
  Function function;
  int score = 3;
  String newText;
  _SimpleCustomAlertState(Restaurant restaurant, User user, Function function){
    this.restaurant = restaurant;
    this.user = user;
    this.function = function;
  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4)
      ),
      child: Container(
        margin: EdgeInsets.all(10),
        height: 250,
        width: 800,
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: SizedBox.expand(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Form(
                          key: _formKey,
                          child: TextFormField(
                            onSaved: (value){
                              if (value.isNotEmpty){
                                newText = value;
                              }
                            },
                            decoration: InputDecoration(
                              filled: true,
                              icon: Icon(Icons.message),
                              labelText: 'comment',
                              labelStyle: TextStyle(
                                fontSize: 20.0,
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text('Rate',
                          style: TextStyle(
                            fontSize: 25,
                          ),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(
                              constraints: BoxConstraints.tightFor(
                                width: 40,
                                height: 40,
                              ),
                              shape: CircleBorder(),
                              fillColor: Colors.orange,
                              child: Text('-',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900,
                                ),),
                              onPressed: (){
                                if (score > 1){
                                  setState(() {
                                    score--;
                                  });
                                }
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(score.toString(),
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.blue[700]
                                  ),),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RawMaterialButton(
                              constraints: BoxConstraints.tightFor(
                                width: 40,
                                height: 40,
                              ),
                              shape: CircleBorder(),
                              fillColor: Colors.orange,
                              child: Text('+',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900,
                                ),),
                              onPressed: (){
                                setState(() {
                                  if (score < 5){
                                    score++;
                                  }
                                });

                              },
                            ),
                          ],
                        ),
                        TextButton(
                          child: Text('Ok',
                          style: TextStyle(
                            fontSize: 20,
                          ),),
                          onPressed: (){
                              _formKey.currentState.save();
                              if (newText != null){
                                Comment newComment = new Comment(score: score,text: newText,user: user);
                                restaurant.comments.add(newComment);
                                user.comments.add(newComment);
                                widget.function(restaurant.comments.length.toString());
                              }
                              Navigator.of(context).pop();
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

