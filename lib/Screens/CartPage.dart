import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snap_food/Screens/RestaurantPage.dart';
import 'package:snap_food/components/Restaurant.dart';
import 'package:snap_food/constants.dart';
import 'package:snap_food/components/User.dart';
class CartPage extends StatefulWidget {
  final User user;
  const CartPage({
    Key key,
    this.user,
  }) : super(key: key);
  @override
  _CartPageState createState() => _CartPageState(user: user);
}

class _CartPageState extends State<CartPage> {
  User user;
  _CartPageState({this.user});
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.grey[500],
        appBar: AppBar(
          title: Text('Cart'),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            Restaurant currentRestaurant = user.cartList.keys.toList()[index];
            return Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                margin: EdgeInsets.only(left: 7, right: 7, top: 10),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          width: 180,
                          height: 120,
                          child: currentRestaurant.image,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 18, bottom: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(currentRestaurant.name,
                                style: restaurantTitleStyle,),
                              SizedBox(
                                height: 15,
                              ),
                              Text('this is date',
                                  style: textStyle),
                              SizedBox(
                                height: 15,
                              ),
                              Text('this is address',
                                  style: textStyle)
                            ],
                          ),
                        ),
                      ],
                    ),
                    ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          child:
                          Container(
                            padding: EdgeInsets.only(left: 10, right: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(user.cartList[currentRestaurant][index].name + " ( " + user.cartList[currentRestaurant][index].counter.toString() + " )"
                                  ,style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(user.cartList[currentRestaurant][index].price.toString() + " \$",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                  ),),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: user.cartList[currentRestaurant].length,
                      shrinkWrap: true, // todo comment this out and check the result
                      physics: ClampingScrollPhysics(), // todo comment this out and check the result
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        CartPageButton(text: 'remove Cart', backgroundColor: Colors.pink,textColor: Colors.white,onTab: (){
                          setState(() {
                            for(int i = 0; i < user.cartList[currentRestaurant].length;i++){
                              user.cartList[currentRestaurant][i].counter = 1;
                            }
                            user.cartList.remove(currentRestaurant);
                          });
                        },),
                        CartPageButton(text: 'continue', backgroundColor: Colors.green[600],textColor: Colors.white,),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: user.cartList.length,
        ),
      );
    }
}

class CartPageButton extends StatelessWidget {
  String text;
  Color backgroundColor;
  Color textColor;
  Function onTab;
  CartPageButton({this.onTab,this.text, this.backgroundColor, this.textColor});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTab,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: backgroundColor,
          ),
          margin: EdgeInsets.all(10),
          height: 60,
          width: 150,
          child: Center(child: Text(text,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 22,
              color: textColor,
              letterSpacing: 1.6,
            ),)),
        ),
      ),
    );
  }
}