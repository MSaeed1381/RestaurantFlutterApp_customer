import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snap_food/components/Food.dart';
import 'package:snap_food/components/Food_Label.dart';
import 'package:snap_food/constants.dart';
class Cart_page extends StatefulWidget {
  @override
  _Cart_pageState createState() => _Cart_pageState();
}

class _Cart_pageState extends State<Cart_page> {
  @override
  Widget build(BuildContext context) {
    List foods = [
      Food(name: "cheese Pizza", details: "2sikh fjskdfds ldfsd fsdif dsf", price: 5 , image: Image(image: AssetImage('images/pizza1.jpg')),),
      Food(name: "cheese Pizza", details: "2sikh fjskdfds ldfsd fsdif dsf", price: 5 , image: Image(image: AssetImage('images/pizza1.jpg')),),
      Food(name: "cheese Pizza", details: "2sikh fjskdfds ldfsd fsdif dsf", price: 5 , image: Image(image: AssetImage('images/pizza1.jpg')),),
      Food(name: "cheese Pizza", details: "2sikh fjskdfds ldfsd fsdif dsf", price: 5 , image: Image(image: AssetImage('images/pizza1.jpg')),),
      Food(name: "cheese Pizza", details: "2sikh fjskdfds ldfsd fsdif dsf", price: 5 , image: Image(image: AssetImage('images/pizza1.jpg')),),
      Food(name: "cheese Pizza", details: "2sikh fjskdfds ldfsd fsdif dsf", price: 5 , image: Image(image: AssetImage('images/pizza1.jpg')),),
      Food(name: "cheese Pizza", details: "2sikh fjskdfds ldfsd fsdif dsf", price: 5 , image: Image(image: AssetImage('images/pizza1.jpg')),),
    ];
    return Scaffold(
        backgroundColor: Colors.grey[600],
        appBar: AppBar(
        ),
        body: Container(),
    );
  }}

class FoodsListView extends StatelessWidget {
  FoodsListView({this.foods});
  List foods;

  @override
  Widget build(BuildContext context) {


    return ListView.builder(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 5,bottom: 5),
        itemCount: foods.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
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
                        child:foods[index].image,
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
                          Text(foods[index].restaurantName,
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
                          margin: EdgeInsets.only(left: 10, bottom: 10, right: 10),
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
                        child: Container(
                          margin: EdgeInsets.only(left: 10,right: 10,bottom: 10),
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
                        ),),
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