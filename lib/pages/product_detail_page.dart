//Packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Models
import '../models/product.dart';

//Widgets
import '../widgets/common_widgets.dart';


//This is the page you are redirected to when you tap on a single product

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {

  bool buttonTapped = false;
  int number = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.cancel),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Product Details'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.grey,
              height: 20,
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(
                widget.product.image.toString(),
                fit: BoxFit.scaleDown,
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text(
                      widget.product.title.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(widget.product.category.toString()),
                  Text(
                    widget.product.price.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.grey,
              height: 30,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Details"),
                ),
              ),
            ),
            Container(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Scrollbar(
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Text(widget.product.description.toString())),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.grey,
              height: 30,
            ),
            SizedBox(
              height: 10.0,
            ),
            buttonTapped ? Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              width: MediaQuery.of(context).size.width * 0.6,
              height: 50.0,
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: Center(child: Text("-",style: TextStyle(fontWeight: FontWeight.bold)))),
                  Container(
                    height: 50.0,
                    width: MediaQuery.of(context).size.width * 0.2,
                    color: Colors.blue,
                      child: Center(child: Text("$number", style: TextStyle(fontWeight: FontWeight.bold),))),
              Container(
                  height: 50.0,
                  width: MediaQuery.of(context).size.width * 0.2 - 2.0,
                  child: Center(child: Text("+",style: TextStyle(fontWeight: FontWeight.bold)),)),
                ],
              ),
            ) : Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: buildButton("ADD TO BASKET", () => changeButtonToCart()),
            ),
          ],
        ),
      ),
    );
  }

  void changeButtonToCart() {
    setState(() {
      buttonTapped = true;
    });
  }
}
