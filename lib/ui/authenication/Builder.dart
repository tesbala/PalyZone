import 'package:flutter/material.dart';
import '../../Constants/Constants.dart';
import '../../Repo/Auth.dart';
import '../../ui/authenication/login.dart';
import '../Home/Home.dart';
import 'SplashScreen.dart';

class AuthendicationBuilderPage extends StatefulWidget {
  const AuthendicationBuilderPage({super.key});

  @override
  State<AuthendicationBuilderPage> createState() => _AccountCheckerPageState();
}

class _AccountCheckerPageState extends State<AuthendicationBuilderPage> {
  AuthStatus status = AuthStatus.Checking;
  @override
  void initState() {
    checkAuthStatusFn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case AuthStatus.Checking:
        return const SplashScreen();
      case AuthStatus.SignedOut:
        return const LoginPage();
      case AuthStatus.SignedIn:
        return const HomePage();
      default:
        return const LinearProgressIndicator();
    }
  }

  Future<void> checkAuthStatusFn() async {
    status = await AuthendicationRepo.checkStatus();
    if (mounted) {
      setState(() {});
    }
  }
}
