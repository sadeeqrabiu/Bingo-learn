import 'package:bingolearn/src/dashboard/home_screen.dart';
import 'package:bingolearn/src/landing/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/local_store/shared_service.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    checkPasscode();
  }

  checkPasscode() async {
    // Check to see if a user is logged in
    bool result = await SharedService.isLoggedIn();

    // Simulate a service call
    await Future.delayed(const Duration(milliseconds: 1500), () {});

    // Navigate to the appropriate page
    if (result) {
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
    } else {
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LandingScreen()),
        );
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    //Media Query
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                // image: DecorationImage(image: AssetImage("assets/block.png"), fit: BoxFit.cover,),
                gradient: LinearGradient(
                    colors: [Color(0xFF11212D), Color(0xFF06141B)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: height * .1, left: width * 0.06, right: width * 0.04),
              child: Center(
                child: Column(
                  children: [

                    SizedBox(
                      height: height * .3,
                    ),
                    SizedBox(
                      height: height * 0.15,
                      width: width,
                      child: SvgPicture.asset(
                        'assets/svgs/BingoOne.svg',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
