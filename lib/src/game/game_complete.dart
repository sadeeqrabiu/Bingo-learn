import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../dashboard/home_screen.dart';
import '../tools/colors.dart';


class GameComplete extends StatefulWidget {
  const GameComplete({
    Key? key,
    required this.incorrect,
    required this.correct,
    // required this.time,
  }) : super(key: key);

  final String? incorrect;
  final String? correct;
  // final String? time;


  @override
  State<GameComplete> createState() => _GameCompleteState();
}

class _GameCompleteState extends State<GameComplete> {
  @override
  Widget build(BuildContext context) {
    //Media Query
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: colorPrimary,
        appBar: AppBar(
          backgroundColor: colorMain,
          toolbarHeight: height * 0.02,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
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
            //
            SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Padding(
                  padding: EdgeInsets.only(left: width * .05, right: width * .05),
                  child: Column(
                    children: [
                      Gap(height * .0),
                      Center(
                        child: Column(
                          children: [
                            SizedBox(
                                width: width,
                                height: height * .2,
                                child: Lottie.asset('assets/lottie/splash.json')),
                            SizedBox(
                                width: width ,
                                height: height * .2,
                                child: Lottie.asset('assets/lottie/completedTask.json')),

                            Text(
                              'Congratulations',
                              style: TextStyle(
                                  color: colorPrimary,
                                  fontWeight: FontWeight.bold),
                            ),
                            Gap(height*.05),
                            Container(
                              height: height*.05,
                              width: width*.7,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                color: colorGreen
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: width*.02),
                                child: Row(
                                  children: [
                                    Text('Correct Words: ${widget.correct}', style: TextStyle(color: colorPrimary ),)
                                  ],
                                ),
                              ),
                            ),

                            Gap(height*.04),
                            Container(
                              height: height*.05,
                              width: width*.7,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                color: colorRed,
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: width*.02),
                                child: Row(
                                  children: [
                                    Text('Incorrect Words: ${widget.incorrect}', style: TextStyle(color: colorPrimary ),)
                                  ],
                                ),
                              ),
                            ),

                            Gap(height*.07),
                            GestureDetector(
                              child: Container(
                                height: height*.05,
                                width: width*.7,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: colorGrey.withOpacity(0.2)
                                ),
                                child: Center(child: Text('Completed', style: TextStyle(color: colorPrimary ),)),
                              ),
                              onTap: (){
                                //
                                ///
                                /////
                                /////This should not return back
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                      return const HomeScreen();
                                    }));
                              },
                            ),
                          ],
                        ),
                      ),

                    ],
                  )),
            )
          ],
        ));
  }
}
