import 'package:flutter/material.dart';



class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Center(
            child: Column(
              children: [

                Text(
                    'Sadiq Rabiu - CST 3990 Individual project,'
                ),
                Text(
                  'Bingo learn,'
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
// This is the starting Point of my Individual Project
// that it has a State object (defined below) that contains fields that affect
