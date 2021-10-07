//Packages
import 'package:flutter/material.dart';

import 'sign_in_page.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              height: 40.0,
              width: MediaQuery.of(context).size.width * 0.25,
              child: Center(child: Text("Select User")),
            ),
            SizedBox(
              height: 16.0,
            ),
            GestureDetector(
              onTap: ()=> Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignInPage()),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                width: MediaQuery.of(context).size.width * 0.5,
                child: Column(
                  children: [
                    Container(height:40.0, child: Center(child: Text("johnd"))),
                    Divider(),
                    Container(height:40.0, child: Center(child: Text("johnd"))),
                    Divider(),
                    Container(height:40.0, child: Center(child: Text("johnd"))),
                    Divider(),
                    Container(height:40.0, child: Center(child: Text("johnd"))),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
