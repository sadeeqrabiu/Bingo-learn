import 'package:bingolearn/src/login_section/login_screen.dart';
import 'package:bingolearn/src/register_section/reg_email.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
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
          child: Column(
            children: [
              const Row(
                children: [
                  Text(
                    'BingoLearn',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                ],
              ),
              SizedBox(
                height: height * .01,
              ),
              //Lottie Animation
              SizedBox(
                  width: width * 8.5,
                  height: height * .4,
                  child: Lottie.asset('assets/lottie/GlobalLearn.json')),

              SizedBox(
                height: height * 0.02,
              ),
              const Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Learn a new language',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white),
                      ),
                      Text(
                        'with Bingo-Learn',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: height*.02,),
              Row(
                children: [
                  SizedBox(
                      width: width*.9,
                      child: const Text(
                          'Dive into personalized lessons, interactive game, and real-time learning with AI. Experience fun and effective language learning anytime, anywhere.', style: TextStyle(color: Colors.white), ))
                ],
              ),

              GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(top: height*.12),
                  height: height*.05,
                  width: width*.6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: const Center(
                    child: Text('Get Started', style: TextStyle(),),
                  ),
                ),
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return const LoginScreen();
                      }));
                },
              )
            ],
          ),
        ),
      ],
    ));
  }
}
// This is the starting Point of the Team Gemini Competition
// that it has a State object (defined below) that contains fields that affect
