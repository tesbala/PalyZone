import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:play/UI/Authenication/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:play/Services/firebase_auth.dart';
import '../../Repo/loading_indicator.dart';
import '../../common/toast.dart';
import '../Home/Home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  // Value for email & password
  late String email, password;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // This key helps with form validation
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuthService _auth = FirebaseAuthService();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bk.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 299),
                const Text(
                  'Welcome',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: 'game',
                      letterSpacing: 9,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 24),

                // Email input field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 39.9),
                  child: Theme(
                    data: ThemeData(
                      inputDecorationTheme: InputDecorationTheme(
                        errorStyle: TextStyle(
                            color: Colors.white, fontWeight: FontWeight
                            .bold // Change this to your desired error message color
                        ),
                      ),
                    ),
                    child: TextFormField(
                      controller: emailController,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }

                        // Email format validation using regular expression
                        String pattern =
                            r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
                        RegExp regex = RegExp(pattern);
                        if (!regex.hasMatch(value)) {
                          return 'Please check email format';
                        }

                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 17.0, horizontal: 15.0),
                        hintStyle: TextStyle(
                            fontSize: 15.0, fontFamily: 'mafia'),
                      ),
                      style: const TextStyle(
                          fontSize: 15.0, fontFamily: 'mafia'),
                    ),
                  ),
                ),


                const SizedBox(height: 23),

                // Password input field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 39.9),
                  child: Theme(
                    data: ThemeData(
                      inputDecorationTheme: InputDecorationTheme(
                        errorStyle: TextStyle(
                            color: Colors.white, fontWeight: FontWeight
                            .bold // Change this to your desired error message color
                        ),
                      ),
                    ),
                    child: TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      // Hide the password text
                      validator: (String? pass) {
                        if (pass == null || pass.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Password',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 17.0, horizontal: 15.0),
                        hintStyle: TextStyle(
                            fontSize: 15.0, fontFamily: 'mafia'),
                      ),
                      style: const TextStyle(
                          fontSize: 15.0, fontFamily: 'mafia'),
                    ),
                  ),
                ),
                _isLoading
                    ? LoadingIndicator() // Show the LoadingIndicator when _isLoading is true
                    : IconButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      _signIn();
                    }
                  },
                  icon: Image.asset(
                    'assets/login.png',
                    height: 70,
                  ),
                ),

                Row(
                  children: <Widget>[
                    Expanded(
                        child: IconButton(
                            onPressed: null,
                            icon: Image.asset(
                              'assets/Line.png',
                              height: 10,
                            ))),
                    Expanded(
                        child: IconButton(
                            onPressed: null,
                            icon: Image.asset(
                              'assets/OR.png',
                              height: 10,
                            ))),
                    Expanded(
                        child: IconButton(
                            onPressed: null,
                            icon: Image.asset(
                              'assets/Line.png',
                              height: 10,
                            ))),
                  ],
                ),

                // Google and Facebook authentication
                Padding(
                  padding: const EdgeInsets.fromLTRB(59, 0, 59, 0),
                  child: Row(
                    children: <Widget>[
                      GestureDetector(onTap:(){  _signInWithGoogle();},
                        child: Expanded(
                            child: IconButton(
                                onPressed: null,
                                icon: Image.asset(
                                  'assets/google.png',
                                  height: 75,
                                ))),
                      ),
                      Expanded(
                          child: IconButton(
                              onPressed: null,
                              icon: Image.asset(
                                'assets/facebook.png',
                                height: 75,
                              ))),
                    ],
                  ),
                ),

                // Navigation to signup page
                SizedBox(
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 19),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        child: const Text(
                          "Sign up",
                          style: TextStyle(fontFamily: 'mafia',
                              color: Colors.blueAccent,
                              fontSize: 19),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<Widget>(
                                builder: (
                                    BuildContext context) => const SignupPage()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _signIn() async {
    setState(() {
      _isLoading = true; // Set isLoading to true when starting sign-in process
    });

    email = emailController.text.trim();
    password = passwordController.text.trim();

    try {
      User? user = await _auth.signInWithEmailAndPassword(email, password);

      if (user != null) {
        showToast(message: 'User signed in successfully');
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute<Widget>(
            builder: (BuildContext context) => const HomePage(),
          ),
              (Route<dynamic> route) => false,
        );
      } else {
        showToast(message: "An error occurred during sign in");
      }
    } finally {
      setState(() {
        _isLoading =
        false; // Set isLoading to false when sign-in process completes
      });
    }
  }

  _signInWithGoogle()async{

    final GoogleSignIn _googleSignIn = GoogleSignIn();

    try {

      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

      if(googleSignInAccount != null ){
        final GoogleSignInAuthentication googleSignInAuthentication = await
        googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        await _firebaseAuth.signInWithCredential(credential);
        Navigator.pushNamed(context, "/home");
      }

    }catch(e) {
      showToast(message: "some error occured $e");
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute<Widget>(
          builder: (BuildContext context) => const HomePage(),
        ),
            (Route<dynamic> route) => false,
      );
    }
  }
}


