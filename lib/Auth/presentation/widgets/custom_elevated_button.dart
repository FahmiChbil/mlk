import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton(
      {super.key, required this.onpress, required this.buttonText});
  final void Function()? onpress;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red.shade600,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      onPressed: onpress,
      child: Text(
        buttonText,
        style: TextStyle(
            fontWeight: FontWeight.w500, fontSize: 15.sp, color: Colors.white),
      ),
    );
  }
}
