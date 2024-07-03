import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../tools/colors.dart';

class LanguagesCard extends StatelessWidget {
  final String? languageName;
  final String? flag;
  const LanguagesCard(
      {super.key, required this.languageName, required this.flag});

  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
    //Media Query
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Column(
      children: [
        Gap(height * 0.02),
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
                        image: NetworkImage(flag!), fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  width: width * .02,
                ),
                Text(
                  languageName!,
                  style: TextStyle(fontWeight: FontWeight.bold, color: colorBlack),
                ),
              ],
            ),
            const CheckboxExample()
          ],
        ),
        Gap(height * .01)
      ],
    );
  }
}
class CheckboxExample extends StatefulWidget {
  const CheckboxExample({super.key});

  @override
  State<CheckboxExample> createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.transparent;
    }

    return Checkbox(
      checkColor: Colors.black,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
