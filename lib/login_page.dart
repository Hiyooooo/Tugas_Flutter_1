import 'package:calculator_app/home_page.dart';
import 'package:calculator_app/register_page.dart';
import 'package:flutter/material.dart';
import 'widgets/custom_button.dart';
import 'widgets/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void loginSystem() {
    final username = usernameController.text;
    final password = passwordController.text;
    if (username == "admin" && password == "admin") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login successful!'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid username or password'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("")),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                "assets/images/logo.png",
                width: 160,
                height: 160,
              ),
            ),

            Center(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  "Fast Counts, Precise Results.",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),

            const SizedBox(height: 20),
            CustomTextField(label: "Username", controller: usernameController),

            const SizedBox(height: 20),
            CustomTextField(label: "Password", controller: passwordController),

            CustomButton(text: "Sign in", onPressed: loginSystem),

            Center(
              child: Container(
                margin: EdgeInsets.only(top: 25),
                child: Text(
                  "Doesn't Have Account?",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),

            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: Text(
                  "Register Now",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
