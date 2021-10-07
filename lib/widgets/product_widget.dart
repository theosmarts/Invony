import 'package:flutter/material.dart';

Widget buildProductGrid(products) {
  return Container(
    child: Expanded(
        child: GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: products
          .map((item) => Card(
                color: Colors.transparent,
                elevation: 0,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: NetworkImage(item.image), fit: BoxFit.cover)),
                  child: Transform.translate(
                    offset: Offset(50, -50),
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 65, vertical: 63),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Icon(
                        Icons.add_shopping_cart,
                        size: 15,
                      ),
                    ),
                  ),
                ),
              ))
          ,
    )),
  );
}







Widget buildProductDetail (product) {
  return Container(
    child: Column(
      children: <Widget>[
        Text(
            product.title
        ),
        Image.network(product.imageUrl),
        SizedBox(
          height:8.0
        ),
        Text(
          product.description
        ),
        Text(
            product.price
        ),

      ],
    )
  );
}
