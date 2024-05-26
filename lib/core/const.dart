import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

var kblue = HexColor("173159");
const String SERVER_FAILURE_MESSAGE = "somthing went wrong";
const String REGISTER_FAILURE_MESSAGE = "register failed";

SnackBar customSnackBar(String message, Color iconColor, IconData icon) {
  return SnackBar(
    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
    behavior: SnackBarBehavior.floating,
    elevation: 2,
    content: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        SizedBox(
          width: 5.w,
        ),
        Text(
          message,
          style: TextStyle(
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    ),
  );
}
