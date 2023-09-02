import 'package:bikebyme/utils/text_utils.dart';

import 'package:flutter/material.dart';

class SideBarWidget extends StatelessWidget {
  SideBarWidget({super.key});

  final List<String> categoryList = ['Best Sale', 'Popular', 'New Arrival'];

  List<Widget> getRotatedBox() {
    List<Widget> rotatedBoxList = [];
    for (int i = 0; i < categoryList.length; i++) {
      var newItem = RotatedBox(
        quarterTurns: 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextUtil(
              text: categoryList[i],
              weight: true,
              color: i == 1 ? Colors.white : Colors.tealAccent[100],
              size: 16,
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              width: 20,
              height: 4,
              color: i == 1 ? const Color(0xffa3bab6) : Colors.transparent,
            ),
          ],
        ),
      );
      rotatedBoxList.add(newItem);
    }
    return rotatedBoxList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      height: double.infinity,
      width: 100,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 180,
          ),
          ...getRotatedBox(), //// Use the spread operator (...) to add the list of widgets
          //By using the spread operator (...), you're adding the individual RotatedBox widgets from the getRotatedBox() function into the list of children for the Column widget. This way, the types match, and you won't encounter the error you mentioned.
          // for (int i = 0; i < categoryList.length; i++) ...[
          //   RotatedBox(
          //     quarterTurns: 3,
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         TextUtil(
          //           text: categoryList[i],
          //           weight: true,
          //           color: i == 1 ? Colors.white : Colors.tealAccent[100],
          //           size: 16,
          //         ),
          //         const SizedBox(
          //           height: 8,
          //         ),
          //         Container(
          //           width: 20,
          //           height: 4,
          //           color:
          //               i == 1 ? const Color(0xffa3bab6) : Colors.transparent,
          //         ),
          //       ],
          //     ),
          //   ),
          // ],
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
