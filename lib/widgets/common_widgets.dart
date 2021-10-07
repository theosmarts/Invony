//Packages
import 'package:flutter/material.dart';

//Common and reusable widgets

Widget buildTextField({context, height, controller, obscureText, maxLength, hintText, counterText} ) {
  return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: height,
      child: TextField(
        obscureText: obscureText,
        maxLength: maxLength,
        style: TextStyle(fontSize: 18.0, color: Colors.black),
        controller: controller,
        autocorrect: true,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          counterText: counterText,
          counterStyle: TextStyle(
              color: Colors.white
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black,
              fontSize: 14,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w100),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ));
}

Widget buildButton(String buttonText, onPressed){
 return ElevatedButton(
   style: ElevatedButton.styleFrom(
     shape: new RoundedRectangleBorder(
       borderRadius: new BorderRadius.circular(10.0),
     ),
   ),
   onPressed: onPressed,
   child: Text(
     buttonText,
     style: TextStyle(
       fontSize: 14.0,
       color: Colors.white,
     ),
   ),
 );
}

AppBar customAppBar(){
  return AppBar(
    automaticallyImplyLeading: false,
    title: Container(
      height: 20,
      child: Image.asset(
        "assets/images/invony_transparent.png",
        fit: BoxFit.cover,
      ),
    ),
    centerTitle: true,
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
          width: 100.0,
          height: 20.0,
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                    ),
                  ),
                  height: 38.0,
                  width: 50,
                  child: Center(child: Icon(Icons.add_shopping_cart,
                  color: Colors.black,))),
              Container(
                  height: 20.0,
                  width: 50-2,
                  color: Colors.blue,
                  child: Center(child: Text("Empty", style: TextStyle(fontWeight: FontWeight.bold),))),
            ],
          ),
        ),
      )
    ],
  );
}