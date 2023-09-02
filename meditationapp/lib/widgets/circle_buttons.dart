import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleButton extends StatelessWidget {
  final bool isSelected;
  final String buttonDescription;
  final IconData iconName;
  const CircleButton({
    super.key,
    required this.buttonDescription,
    required this.iconName,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                blurRadius: 10.r,
                color: Colors.black,
                offset: const Offset(5, 10),
              )
            ],
            color: isSelected ? Colors.white : Colors.white24,
          ),
          width: 70.r,
          height: 70.r,
          child: Icon(
            iconName,
            color: isSelected ? Colors.black : Colors.white,
            size: 25.r,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          buttonDescription,
          style: TextStyle(color: Colors.white, fontSize: 18.r),
        )
      ],
    );
  }
}
