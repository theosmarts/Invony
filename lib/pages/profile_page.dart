//Packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//This page displays the user profile

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey,
            height: 20.0,
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.person),
                    VerticalDivider(
                      thickness: 2.0,
                    ),
                    Text("Login"),
                  ],
                ),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
          Container(
            color: Colors.grey,
            height: 20.0,
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 40.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_pin),
                          VerticalDivider(
                            thickness: 2.0,
                          ),
                          Text("Address"),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
                Divider(),
                Container(
                  height: 40.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.help),
                          VerticalDivider(
                            thickness: 2.0,
                          ),
                          Text("Support"),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
              ],
            ),
          ),

          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.grey,
            height: 50,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Language - Langue"),
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.all(8.0),
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("English"),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),

        ],
      ),
    );
  }
}
