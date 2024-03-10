import 'package:flutter/material.dart';
import 'package:rick_and_morty/presentation/resources/app_pngs.dart';
import 'package:rick_and_morty/presentation/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

   @override
  void initState() {
    routing();
    super.initState();
  }

  Future<void> routing()async{
    await Future.delayed(const Duration(seconds: 2),
    );
    // ignore: use_build_context_synchronously
    Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
  }
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        AppPngs.splash,
        fit: BoxFit.fill,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      ),
    );
  }
}
