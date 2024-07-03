import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../tools/colors.dart';



class LanguagesLoader extends StatelessWidget {
  const LanguagesLoader({super.key});

  @override
  Widget build(BuildContext context) {
    //Media Query
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return  Padding(
      padding: EdgeInsets.only(left: height*0.02, right: height*0.0, top: height*0.04),
      child: Shimmer.fromColors(
        baseColor: Colors.black.withOpacity(0.3),
        highlightColor: Colors.grey[100]!,
        child: Row(
          children: [
            Skeleton(height: height*0.02, width: width*0.5),

          ],
        ),
      ),
    );
  }

}
class Skeleton extends StatelessWidget {
  const Skeleton({Key? key, this.height, this.width}) : super(key: key);

  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
          borderRadius:
          const BorderRadius.all(Radius.circular(defaultPadding))),
    );
  }
}
