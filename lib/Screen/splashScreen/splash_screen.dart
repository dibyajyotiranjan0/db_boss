import 'package:dpboss/Screen/web_view/app_url.dart';
import 'package:dpboss/Screen/web_view/dpboss_servcess.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 3), () {
        // var currentD = DateTime(
        //     DateTime.now().year, DateTime.now().month, DateTime.now().day);
        // var todayDate = DateTime.parse("2024-06-29");
        // if (currentD == todayDate) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => ShowWeb(
                      urll: AppUrl.home,
                    )));
        // }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFCC99),
      body: Center(
        child: Image.asset("assets/logo/dpboss_service.png"),
      ),
    );
  }
}
