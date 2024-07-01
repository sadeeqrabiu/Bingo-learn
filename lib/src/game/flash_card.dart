import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../tools/colors.dart';



class FlashCard extends StatefulWidget {
  const FlashCard({super.key});

  @override
  State<FlashCard> createState() => _FlashCardState();
}

class _FlashCardState extends State<FlashCard> {
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
            Padding(
                padding: EdgeInsets.only(left: width * .05, right: width * .05),
                child: Column(
                  children: [
                    //Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: Icon(
                            EvaIcons.close,
                            color: colorPrimary,
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        Text(
                          'Flash Card',
                          style: TextStyle(
                              color: colorPrimary, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: width * .07,
                        )
                      ],
                    ),

                    Gap(height*.04),
                    Padding(
                      padding: EdgeInsets.only(left: width*.06, right: width*.06),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text('cards:', style: TextStyle(color: colorPrimary, fontSize: 15, fontWeight: FontWeight.bold),),
                              Text(' 10/10', style: TextStyle(color: colorPrimary),)
                            ],
                          ),
                          Row(
                            children: [
                              Text('Time:', style: TextStyle(color: colorPrimary, fontSize: 15, fontWeight: FontWeight.bold),),
                              Text('00:30', style: TextStyle(color: colorPrimary),)
                            ],
                          ),

                        ],
                      ),
                    ),

                    Gap(height*.04),
                    Center(
                      child: SizedBox(
                        width: width*.5,
                          child: Text('Lorem ipsum dolor sit amet, ___________lectus.', style: TextStyle(color: colorPrimary),)),
                    ),

                    //Card section

                    Gap(height*.02),
                    Container(
                      height: height*.04,
                      width: width*.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: colorGrey.withOpacity(0.2),
                      ),
                      child: Center(
                        child: Text('Select Card', style: TextStyle(color: colorPrimary),),
                      ),
                    )

                  ],
                ))
          ],
        ));
  }
}
