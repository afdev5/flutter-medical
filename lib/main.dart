import 'package:flutter/material.dart';
import 'package:flutter_medical/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Medical',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          
          padding: EdgeInsets.all(14),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  child: Image.asset(
                    "assets/bg.jpg",
                  ),
                ),
                SizedBox(height: 15),
                inputText(),
                SizedBox(height: 35),
                isLoading
                    ? CircularProgressIndicator(
                        backgroundColor: Color(0xffFF725E))
                    : ElevatedButton(
                        onPressed: onTap,
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 20),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xffFF725E),
                          padding: EdgeInsets.fromLTRB(150, 15, 150, 15),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget inputText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Welcome to\nFlutter Medical Apps",
            style: TextStyle(
                color: Colors.grey[800],
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                height: 1.5)),
        SizedBox(height: 25),
        TextField(
          controller: _phoneNumberController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffFF725E)),
                  borderRadius: BorderRadius.circular(15)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffFF725E)),
                  borderRadius: BorderRadius.circular(15)),
              hintText: "Phone Number"),
        ),
        SizedBox(height: 15),
        TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffFF725E)),
                  borderRadius: BorderRadius.circular(15)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffFF725E)),
                  borderRadius: BorderRadius.circular(15)),
              hintText: "Password"),
        )
      ],
    );
  }

  void onTap() {
    setState(() => isLoading = !isLoading);
    Future.delayed(Duration(seconds: 4), () {
      if (_phoneNumberController.text.length < 11 ||
          _passwordController.text.length < 6) {
        setState(() => isLoading = !isLoading);
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Error"),
                content:
                    Text("Phone number min 11 and Password min 6 character"),
              );
            });
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    });
  }
}
