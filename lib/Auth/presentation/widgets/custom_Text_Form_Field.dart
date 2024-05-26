import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mlk/core/const.dart';

class CustomTextFomField extends StatefulWidget {
  CustomTextFomField(
      {super.key,
      required this.val,
      required this.label,
      required this.keytype,
      required this.myContoller,
      required this.myhint,
      required this.suffix,
      required this.obscure});
  String? Function(String?)? val;
  final String label;
  TextInputType? keytype;
  TextEditingController? myContoller;
  final Widget? suffix;
  final String? myhint;
  final bool obscure;

  @override
  State<CustomTextFomField> createState() => _CustomTextFomFieldState();
}

class _CustomTextFomFieldState extends State<CustomTextFomField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 18.w, right: 18.w, bottom: 23.h),
      child: TextFormField(
          obscureText: widget.obscure,
          controller: widget.myContoller,
          keyboardType: widget.keytype,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
              suffixIcon: widget.suffix,
              hintText: widget.myhint,
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kblue, width: 3),
                  borderRadius: BorderRadius.circular(12)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: kblue, width: 3),
                  borderRadius: BorderRadius.circular(12)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kblue, width: 3),
                  borderRadius: BorderRadius.circular(12)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kblue, width: 3),
                  borderRadius: BorderRadius.circular(12)),
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kblue, width: 3),
                  borderRadius: BorderRadius.circular(12)),
              labelText: widget.label,
              errorStyle:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp),
              labelStyle: TextStyle(color: kblue, fontWeight: FontWeight.w700)),
          validator: widget.val),
    );
  }
}
