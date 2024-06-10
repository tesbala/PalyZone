import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Repo/loading_indicator.dart';
import '../../Services/firebase_auth.dart';
import '../../common/toast.dart';
import '../Home/Home.dart';
import 'login.dart'; // Assuming this is the HomePage import

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupState();
}

class _SignupState extends State<SignupPage> {
  String? email, password, confirmPassword;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

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
                const SizedBox(
                  height: 280,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 39.9),
                  child: Theme(
                    data: ThemeData(
                      inputDecorationTheme: InputDecorationTheme(
                        errorStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    child: TextFormField(
                      controller: emailController,
                      validator: (String? email) {
                        if (email == null || email.isEmpty) {
                          return 'Please enter the email';
                        }
                        String pattern =
                            r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
                        RegExp regex = RegExp(pattern);
                        if (!regex.hasMatch(email)) {
                          return 'Please check email format';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 17.0, horizontal: 15.0),
                        hintStyle: TextStyle(fontSize: 15.0, fontFamily: 'mafia'),
                      ),
                      style: const TextStyle(fontSize: 15.0, fontFamily: 'mafia'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 39.9),
                  child: Theme(
                    data: ThemeData(
                      inputDecorationTheme: InputDecorationTheme(
                        errorStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
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
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 17.0, horizontal: 15.0),
                        hintStyle: TextStyle(fontSize: 15.0, fontFamily: 'mafia'),
                      ),
                      style: const TextStyle(fontSize: 15.0, fontFamily: 'mafia'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 39.9),
                  child: Theme(
                    data: ThemeData(
                      inputDecorationTheme: InputDecorationTheme(
                        errorStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    child: TextFormField(
                      controller: confirmPasswordController,
                      obscureText: true,
                      validator: (String? confirmPass) {
                        if (confirmPass == null || confirmPass.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (confirmPass != passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Confirm Password',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 17.0, horizontal: 15.0),
                        hintStyle: TextStyle(fontSize: 15.0, fontFamily: 'mafia'),
                      ),
                      style: const TextStyle(fontSize: 15.0, fontFamily: 'mafia'),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                _isLoading
                    ? LoadingIndicator()
                    : IconButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      _signUp();
                    }
                  },
                  icon: Image.asset(
                    'assets/signup.png',
                    height: 60,
                  ),
                ),
                SizedBox(
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account ",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19),
                      ),
                      SizedBox(width: 5),
                      GestureDetector(
                        child: Text(
                          "Login",
                          style: TextStyle(fontFamily: 'mafia', color: Colors.blueAccent, fontSize: 19),
                        ),
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute<Widget>(
                                builder: (BuildContext context) => const LoginPage()),
                                (Route<dynamic> route) => false,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.fromLTRB(59, 0, 59, 0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: IconButton(
                          onPressed: null,
                          icon: Image.asset(
                            'assets/google.png',
                            height: 75,
                          ),
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          onPressed: null,
                          icon: Image.asset(
                            'assets/facebook.png',
                            height: 75,
                          ),
                        ),
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

  void _signUp() async {
    setState(() {
      _isLoading = true;
    });
    email = emailController.text.trim();
    password = passwordController.text.trim();

    User? user = await _auth.signUpWithEmailAndPassword(email!, password!);

    if (user != null) {
      showToast(message: 'User created successfully');
      Navigator.push(
        context,
        MaterialPageRoute<Widget>(
            builder: (BuildContext context) => HomePage()), // Navigate to HomePage
      );
    } else {
      showToast(message: "An error occurred during sign up");
    }
    setState(() {
      _isLoading = false; // Set isLoading to false when sign-up process completes
    });
  }


}
