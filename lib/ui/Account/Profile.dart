import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../common/toast.dart';
import '../Authenication/login.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _nameController = TextEditingController();

  void _saveName() async {
    String name = _nameController.text;
    if (name.isNotEmpty) {
      await FirebaseFirestore.instance.collection('users').add({'name': name});
      showToast(message: "Name saved to Firebase!");
      _nameController.clear();
    } else {
      showToast(message: "Please enter a name.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/home.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 70,
              ),
              GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  showToast(message: "Successfully signed out");
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute<Widget>(
                        builder: (BuildContext context) => const LoginPage()),
                        (Route<dynamic> route) => false,
                  );
                },
                child:  Padding(
                  padding: EdgeInsets.only(left: 290),
                  child: Image.asset(
                    'assets/logout.png',
                    height: 40,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                'assets/upload.png',
                height: 111,
              ),
              const SizedBox(
                height: 18,
              ),
              const Text(
                'Enter your name',
                style: TextStyle(
                  fontSize: 26,
                  fontFamily: 'mafia',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: _saveName,
                child: const Text('Save Name'),
              ),
              const SizedBox(
                height: 17,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/money-bag.png',
                    height: 40,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  const Text(
                    '₹100',
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'mafia',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 17,
              ),
              Image.asset(
                'assets/addm.png',
                height: 72,
              ),
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                'assets/bank.png',
                height: 72,
              ),
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                'assets/info.png',
                height: 72,
              ),
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                'assets/history.png',
                height: 72,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
