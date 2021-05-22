import 'package:flutter/material.dart';
import 'package:snap_food/Screens/RestaurantPage.dart';
import 'package:snap_food/constants.dart';
import 'User.dart';
class RestaurantListView extends StatelessWidget {
  RestaurantListView({this.restaurants, this.user});
  List restaurants;
  User user;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 5),
        itemCount: restaurants.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    Restaurant_page(restaurant: restaurants[index], user: user, restaurants: restaurants,)));
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        width: 170,
                        height: 120,
                        child: restaurants[index].image,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(restaurants[index].name,
                            style: restaurantListStyle,
                          ),
                          //TODO restaurant address

                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}