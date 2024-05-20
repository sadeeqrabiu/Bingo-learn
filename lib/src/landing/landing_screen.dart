import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

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
              top: height * .1, left: width * 0.04, right: width * 0.04),
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
                height: height * .04,
              ),
              SizedBox(
                height: height * 0.35,
                width: width,
                child: SvgPicture.asset(
                  'assets/svgs/BingoLand.svg',
                ),
              ),
              SizedBox(
                height: height * 0.04,
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
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla turpis sapien, dignissim vel dolor aliquet, dictum egestas lectus. ', style: TextStyle(color: Colors.white), ))
                ],
              ),

              GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(top: height*.12),
                  height: height*.06,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: const Center(
                    child: Text('Get Started', style: TextStyle(),),
                  ),
                ),
                onTap: (){

                },
              )
            ],
          ),
        ),
      ],
    ));
  }
}
// This is the starting Point of my Individual Project
// that it has a State object (defined below) that contains fields that affect
