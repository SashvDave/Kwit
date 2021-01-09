import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kwit/screens/register.dart';
import 'package:kwit/screens/sad1.dart';
import 'package:kwit/screens/sad2.dart';
import 'package:firebase_core/firebase_core.dart';
import './shockTherapy.dart';

void main() async {
  runApp(loginScreen());
}

class loginScreen extends StatelessWidget {
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
      home: login(title: 'Flutter Demo Home Page'),
    );
  }
}

class login extends StatefulWidget {
  login({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  LoginScreen createState() => LoginScreen();
}

final FirebaseAuth _auth = FirebaseAuth.instance;

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final GoogleSignIn googleSignIn = GoogleSignIn();

class LoginScreen extends State<login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<FirebaseUser> _handleSigninWithEmail(
      String email, String password) async {
    AuthResult authResult = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    final FirebaseUser user = authResult.user;

    //assert(user != null);
    //assert(await user.getIdToken() != null);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ShockTherapy()));
    print("Signed in user:");
    return user;
  }

  Future<FirebaseUser> _handleSigninWithGoogle(
      GoogleSignIn googleSignIn) async {
    print("hi");
    final GoogleSignInAccount googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    print("signed in ");
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ShockTherapy()));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/newlogin.png'),
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
                      borderSide: BorderSide(width: 1, color: Colors.blue),
                    ),
                    border: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    hintText: 'Enter your email ID',
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Email',
                    contentPadding:
                        new EdgeInsets.fromLTRB(20.0, -10.0, 20.0, 10.0),
                  ),
                  validator: (input) =>
                      input.isEmpty ? 'You must enter an email' : null,
                ),
              ),
              new Container(
                margin:
                    EdgeInsets.only(top: 20, bottom: 0, left: 30, right: 30),
                child: TextFormField(
                  controller: _passwordController,
                  decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.blue),
                    ),
                    border: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    hintText: 'Enter your password here',
                    prefixIcon: Icon(Icons.lock),
                    labelText: 'Password',
                    contentPadding:
                        new EdgeInsets.fromLTRB(20.0, -10.0, 20.0, 10.0),
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
                      _handleSigninWithEmail(_emailController.text.trim(),
                          _passwordController.text);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    label: Text('Sign In',
                        style: TextStyle(color: Colors.black, fontSize: 17)),
                    icon:
                        Icon(Icons.supervised_user_circle, color: Colors.black),
                    padding: const EdgeInsets.all(13.0),
                    splashColor: Colors.lightBlue[200],
                    color: const Color(0xFFABF6D4)),
              ),
              new Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
                child: RaisedButton.icon(
                    onPressed: () {
                      _handleSigninWithGoogle(googleSignIn);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    label: Text('Sign in with Google',
                        style: TextStyle(color: Colors.black, fontSize: 17)),
                    icon: Icon(
                      Icons.explore,
                      color: Colors.black,
                    ),
                    padding: const EdgeInsets.all(13.0),
                    splashColor: Colors.lightBlue[100],
                    color: const Color(0xFFABF6D4)),
              ),
              new InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => register()));
                },
                child: Text(
                  'Create Account',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
