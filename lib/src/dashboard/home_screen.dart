import 'package:flutter/material.dart';

import '../tools/colors.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            Container(
              margin: EdgeInsets.only(
                  top: height * .1, left: width * 0.04, right: width * 0.04),
              child: Column(
                children: [

                ],
              ),
            ),
          ],
        ));
  }
}
