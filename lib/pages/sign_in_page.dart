//Packages
import 'package:flutter/material.dart';
import 'package:invony/widgets/common_widgets.dart';

//Pages
import 'home_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController usernameController = TextEditingController(text: "johnd");
  TextEditingController passwordController = TextEditingController();
  bool areTextFieldsEmpty = true;

  @override
  void initState() {
    super.initState();
    usernameController.addListener(checkIfTextFieldsAreEmpty);
    passwordController.addListener(checkIfTextFieldsAreEmpty);
  }

  bool checkIfTextFieldsAreEmpty() {
    setState(() {
      if (usernameController.text.trim().length == 0 ||
          passwordController.text.trim().length == 0) {
        areTextFieldsEmpty = true;
      } else {
        areTextFieldsEmpty = false;
      }
    });
    return areTextFieldsEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image.asset('assets/images/invony_transparent.png'),
              ),
              SizedBox(
                height: 16.0,
              ),
              buildTextField(
                  obscureText: false,
                  maxLength: 50,
                  context: context,
                  controller: usernameController,
                  hintText: "Enter any userName"),
              SizedBox(
                height: 8.0,
              ),
              buildTextField(
                  obscureText: true,
                  maxLength: 50,
                  context: context,
                  controller: passwordController,
                  hintText: "Enter any password"),
              SizedBox(
                height: 8.0,
              ),
              buildButton(
                  "Submit", areTextFieldsEmpty ? null : handleSubmit)
            ],
          ),
        ),
    );
  }

  void handleSubmit() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

}
