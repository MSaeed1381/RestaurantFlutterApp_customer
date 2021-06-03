import 'package:flutter/material.dart';
import 'package:snap_food/Screens/RestaurantPage.dart';
import 'package:snap_food/components/MyNotFoundContainer.dart';
import 'package:snap_food/constants.dart';
import 'User.dart';
class FoodsListView extends StatelessWidget {
  FoodsListView({this.foods, this.user, this.restaurant});
  List foods;
  var restaurant;
  User user;
  @override
  Widget build(BuildContext context) {
    if (foods.isEmpty) {
      return MyNotFoundContainer(text: "sorry! no food found");
    } else {
      return ListView.builder(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 5),
        itemCount: foods.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
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
                      child: foods[index].image,
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
                        Text(foods[index].name,
                          style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.6,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(foods[index].details,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),),
                        SizedBox(
                          height: 5,
                        ),
                        Text(restaurant.name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: Colors.green[400],
                        margin: EdgeInsets.only(
                            left: 10, bottom: 10, right: 10),
                        //padding: EdgeInsets.only(left: 15, bottom: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(foods[index].price.toString(),
                                style: cardstyle
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.monetization_on_sharp,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: GestureDetector(
                        onTap: (){
                          _showToast(context);
                            if (user.cartList.keys.contains(restaurant)) {
                              print(user.cartList);
                              if (user.cartList[restaurant].contains(
                                  foods[index])) {
                                foods[index].counter++;
                              }
                              else {
                                user.cartList[restaurant].add(foods[index]);
                              }
                            }
                            else {
                              user.cartList[restaurant] = [];
                              user.cartList[restaurant].add(foods[index]);
                            }
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 10, right: 10, bottom: 10),
                          color: Colors.grey[400],
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.shopping_cart,
                                size: 20,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("add cart",
                                style: cardstyle,),
                            ],
                          ),
                        ),
                      ),),
                  ],
                ),
              ],
            ),
          );
        }
    );
    }
  }
  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.check_box,color: Colors.green,),
            SizedBox(
              width: 10,
            ),
            Text('Successfully Added Cart',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),),
          ],
        ),
        action: SnackBarAction(
            label: 'close', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}
