import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("SMARTEX",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 60,
                      fontWeight: FontWeight.bold)),

              const Text("Register Account",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Username',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),

              //email side
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),

              //password editted side
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),

              //confirm password side
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),

              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue, elevation: 5),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Sign up",
                      style: TextStyle(fontSize: 30),
                    ),
                  )),

              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Already have account?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "  Sign in",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
