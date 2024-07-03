import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../tools/colors.dart';



class LanguageVerify extends StatefulWidget {
  const LanguageVerify({
    Key ? key,
    required this.name,
    required this.language,
    required this.flag,
  }) : super (key: key);

  final String? name;
  final String? language;
  final String? flag;


  @override
  State<LanguageVerify> createState() => _LanguageVerifyState();
}

class _LanguageVerifyState extends State<LanguageVerify> {
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
                  top: height * 0.01, right: width * 0.07, left: width * 0.07),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: [
                      SizedBox(
                        height: height * .15,
                        child: SvgPicture.asset(
                          'assets/svgs/Bingo.svg',
                        ),
                      ),
                      SizedBox(
                        width: width * .02,
                      ),
                       Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Hi, ',
                                style:
                                TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              Text(
                                widget.name!,
                                style:
                                TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ],
                          ),
                          Text('Welcome to bengo-Learn 🎊')
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * .03,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Choose your language',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      Text(
                        'A new and existing way to learn',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * .04,
                  ),
                  const Row(
                    children: [
                      Text(
                        'I speak', style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  ),
                  SizedBox(height: height*.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('English', style: TextStyle(fontSize: 15),),
                      Row(
                        children: [
                          Container(
                            height: height*.04,
                            width: width*.17,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: colorMain,
                            ),
                            child: Center(
                              child: Text('Yes', style: TextStyle(color: colorPrimary, fontWeight: FontWeight.bold),),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: height*.02,),
                  Divider(
                    thickness: 2,
                    color: colorGrey,
                  ),
                  SizedBox(height: height*.03,),
                  const Row(
                    children: [
                      Text(
                        'I want to learn', style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: height * 0.04,
                            width: width * .1,
                            decoration: BoxDecoration(
                              color: colorSecondary,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(widget.flag!), fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(
                            width: width * .02,
                          ),
                          Text(
                            widget.language!,
                            style: TextStyle(fontWeight: FontWeight.bold, color: colorBlack),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: height*0),
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
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) {
                      //       return const LearningGoal();
                      //     }));
                    },

                  ),
                ],
              ),
            ),
          )),
    );
  }
}
