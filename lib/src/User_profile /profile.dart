import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../core/local_store/shared_service.dart';
import '../tools/colors.dart';

class Profile extends StatefulWidget {
  const Profile({
    Key? key,
    required this.flag,
    required this.userName,
  }) : super(key: key);

  final String? flag;
  final String? userName;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
      bottomNavigationBar: BottomAppBar(
        height: height*0.08,
        color: colorPrimary,
        child: GestureDetector(
          child: SizedBox(
            height: height * 0.09,
            width: width,
            child: SvgPicture.asset(
              'assets/svgs/SignOut.svg',
            ),
          ),
          onTap: (){
            SharedService.logout(context);
          },
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(left: width * .05, right: width * .05),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: const Icon(
                    EvaIcons.arrowIosBackOutline,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const Text(
                  'Profile',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: width * .05,
                )
              ],
            ),
            Gap(height*.02),
            Row(
              children: [
                SizedBox(
                  width: width * 0.15,
                  child: Container(
                    height: height * .09,
                    decoration: BoxDecoration(
                      border: Border.all(color: colorBlack.withOpacity(0.2)),
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                          image: AssetImage('assets/images/Avatar.png'),),
                     
                    ),
                  ),
                ),
                Gap(width*.02),
                SizedBox(
                  width: width * 0.13,
                  child: Container(
                    height: height * 0.065,
                    decoration: BoxDecoration(
                      color: colorSecondary,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage('${widget.flag}'),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Gap(width*.02),
                SizedBox(
                  width: width * 0.12,
                  child: Container(
                    height: height * 0.05,
                    decoration: BoxDecoration(
                      border: Border.all(color: colorBlack.withOpacity(0.2)),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(EvaIcons.plus),
                    ),
                  ),
                ),
              ],
            ),
            Gap(height*.01),
             Row(
              children: [
                Text('${widget.userName}', style: TextStyle(fontWeight: FontWeight.bold),)
              ],
            ),
            Gap(height*.02),
            Container(
              height: height*.05,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: colorBlack
              ),
              child: Padding(
                padding:  EdgeInsets.only(left: width*.05, right: width*.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('level 1', style: TextStyle(color: colorPrimary),),
                    SizedBox(
                      height: height * 0.03,
                      child: SvgPicture.asset(
                        'assets/icons/fireIcon.svg',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
