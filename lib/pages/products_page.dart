//Packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invony/exceptions/custom_exception.dart';
import 'package:invony/pages/product_detail_page.dart';
import 'package:invony/providers/global_providers.dart';
import 'package:invony/widgets/common_widgets.dart';

import 'error_page.dart';

class ProductsPage extends ConsumerWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      appBar: customAppBar(),
      body: watch(productFutureProvider).when(
        error: (e, s) {
          if (e is CustomException) {
            return ErrorPage(message: e.message);
          }
          return ErrorPage(
            message: "Oops, something unexpected happened",
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        data: (products) {
          final page1 = products.sublist(0, 9);
          final page2 = products.sublist(10);

          //RefreshIndicator enables us to pull the screen down to make another call to the API
          return RefreshIndicator(
            onRefresh: () {
              return context.refresh(productFutureProvider);
            },
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 8.0),
                  height: 60,
                  child: ListView(
                    // This next line does the trick.
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: 160.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(Icons.done),
                              Text("1-10 Products"),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: 160.0,
                          child: Center(child: Text("11-15 Products")),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: 160.0,
                          child: Center(child: Text("16-20 Products")),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      // Generate widgets that display their index in the List.
                      children: List.generate(products.length, (index) {
                        return GestureDetector(
                          onTap: ()=> goToProductDetailPage(context, products[index]),
                          child: Card(
                            color: Colors.transparent,
                            elevation: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                //border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          products[index].image.toString()),
                                      fit: BoxFit.fill)),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  //margin: EdgeInsets.symmetric(
                                      //horizontal: 65, vertical: 63),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  child: Icon(
                                    Icons.add_box_outlined,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );

    // Column(
    //   children: [
    //     Container(
    //       height: 80,
    //       child: ListView(
    //         // This next line does the trick.
    //         scrollDirection: Axis.horizontal,
    //         children: <Widget>[
    //           Container(
    //             width: 160.0,
    //             color: Colors.red,
    //           ),
    //           Container(
    //             width: 160.0,
    //             color: Colors.blue,
    //           ),
    //           Container(
    //             width: 160.0,
    //             color: Colors.green,
    //           ),
    //           Container(
    //             width: 160.0,
    //             color: Colors.yellow,
    //           ),
    //           Container(
    //             width: 160.0,
    //             color: Colors.orange,
    //           ),
    //         ],
    //       ),
    //     ),
    //     SizedBox(
    //       height: 20,
    //     ),
    //     Container(
    //       height:100,
    //       color: Colors.redAccent,
    //     )
    //
    //   ],
    // )
    //);
  }

  goToProductDetailPage(context, product){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProductDetailPage(product: product)),
    );
  }
}
