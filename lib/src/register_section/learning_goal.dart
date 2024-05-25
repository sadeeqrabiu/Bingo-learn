import 'package:bingolearn/src/dashboard/home_screen.dart';
import 'package:flutter/material.dart';

import '../tools/colors.dart';



class LearningGoal extends StatefulWidget {
  const LearningGoal({super.key});

  @override
  State<LearningGoal> createState() => _LearningGoalState();
}

class _LearningGoalState extends State<LearningGoal> {
  @override
  Widget build(BuildContext context) {
    //MediaQuery
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: colorPrimary,
      appBar: AppBar(
        backgroundColor: colorPrimary,
        toolbarHeight: height * 0.02,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Container(
              margin: EdgeInsets.only(
                  top: height * 0.04, right: width * 0.07, left: width * 0.07),
              child:  Column(
                children: [
                  const Center(
                    child: Column(
                      children: [
                        Text('What’s your daily',style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                        Text('learning goals?', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  SizedBox(height: height*.05,),
                  Column(
                    children: [
                      Container(
                        height: height*.053,
                        width: width,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: colorGrey.withOpacity(0.9)
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: colorPrimary,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(right: width*.04, left: width*.04),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('15min / day'),
                              Text('CheckBox'),
                            ],
                          ),
                        ),

                      ),
                      SizedBox(height: height*.01,),
                      Container(
                        height: height*.053,
                        width: width,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: colorGrey.withOpacity(0.9)
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: colorPrimary,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(right: width*.04, left: width*.04),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('20min / day'),
                              Text('CheckBox'),
                            ],
                          ),
                        ),

                      ),
                      SizedBox(height: height*.01,),
                      Container(
                        height: height*.053,
                        width: width,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: colorGrey.withOpacity(0.9)
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: colorPrimary,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(right: width*.04, left: width*.04),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('30min / day'),
                              Text('CheckBox'),
                            ],
                          ),
                        ),

                      ),
                    ],
                  ),

                  SizedBox(height: height*.4),
                  GestureDetector(
                    child: Container(
                      height: height * 0.06,
                      margin: EdgeInsets.only(
                        left: width * 0.05,
                        right: width * 0.05,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: colorMain),
                      child: Center(
                        child: Text(
                          'Continue',
                          style: TextStyle(color: colorPrimary),
                        ),
                      ),
                    ),
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return const HomeScreen();
                          }));
                    },

                  ),

                ],
              )
            ),
          )),
    );
  }
}
