import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kwit/screens/dashboard.dart';
import 'package:kwit/screens/login.dart';
import 'package:kwit/shockTherapy.dart';

void main() {
  runApp(registerscreen());
}

class registerscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.light,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: const Color(0xFF235866)),
      home: register(title: 'Flutter Demo Home Page'),
    );
  }
}

class register extends StatefulWidget {
  register({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  RegisterScreen createState() => RegisterScreen();
}

final FirebaseAuth _auth = FirebaseAuth.instance;
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
TextEditingController addressController = TextEditingController();

class RegisterScreen extends State<register> {
  Future<FirebaseUser> _handleSignUp(String email, String password) async {
    final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ))
        .user;
    print('Signed user up: ');
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ShockTherapy()));
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF235866),
            image: DecorationImage(
              image: AssetImage('assets/newreg.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Form(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              new Container(
                margin:
                    EdgeInsets.only(top: 550, bottom: 0, left: 30, right: 30),
                child: TextFormField(
                  controller: _emailController,
                  decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.lightBlue),
                    ),
                    border: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.lightBlue, width: 2.0),
                    ),
                    hintText: 'Enter your email ID',
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Email',
                    contentPadding: new EdgeInsets.fromLTRB(
                      20.0,
                      10.0,
                      20.0,
                      10.0,
                    ),
                  ),
                  validator: (input) =>
                      input.isEmpty ? 'You must enter an email ID' : null,
                ),
              ),
              new Container(
                margin:
                    EdgeInsets.only(top: 20, bottom: 0, left: 30, right: 30),
                child: TextFormField(
                  decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.lightBlue),
                    ),
                    border: const OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: const Color(0xFFABF6D4), width: 2.0),
                    ),
                    hintText: 'Enter your password here',
                    prefixIcon: Icon(Icons.lock),
                    labelText: 'Password',
                    contentPadding: new EdgeInsets.fromLTRB(
                      20.0,
                      10.0,
                      20.0,
                      10.0,
                    ),
                  ),
                  obscureText: true,
                  validator: (input) =>
                      input.isEmpty ? 'You must enter a password' : null,
                ),
              ),
              new Container(
                margin:
                    EdgeInsets.only(top: 20, bottom: 0, left: 30, right: 30),
                child: TextFormField(
                  controller: _passwordController,
                  decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.lightBlue),
                    ),
                    border: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.lightBlue, width: 2.0),
                    ),
                    hintText: 'Confirm password here',
                    prefixIcon: Icon(Icons.vpn_key),
                    labelText: 'Confirm Password ',
                    contentPadding: new EdgeInsets.fromLTRB(
                      20.0,
                      10.0,
                      20.0,
                      10.0,
                    ),
                  ),
                  obscureText: true,
                  validator: (input) =>
                      input.isEmpty ? 'You must enter a password' : null,
                ),
              ),
              new Container(
                margin: EdgeInsets.only(top: 5),
                padding: EdgeInsets.all(20.0),
                child: RaisedButton.icon(
                    onPressed: () {
                      this._handleSignUp(_emailController.text.trim(),
                          _passwordController.text.trim());
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    label: Text('Create Account',
                        style: TextStyle(color: Colors.black, fontSize: 17)),
                    icon:
                        Icon(Icons.supervised_user_circle, color: Colors.black),
                    padding: const EdgeInsets.all(13.0),
                    splashColor: Colors.lightBlue[200],
                    color: const Color(0xFFABF6D4)),
              ),
              new InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => login()));
                },
                child: Text(
                  'Sign in with existing account',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
