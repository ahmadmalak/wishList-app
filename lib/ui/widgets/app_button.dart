import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  AppButton({Key? key, required this.text,required this.onTaps}) : super(key: key);
  String text;
 final  VoidCallback onTaps;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTaps,
      child: Container(
        height: 45.h,
        width: 280.w,
        child: Center(child: Text(text,style: TextStyle(color:Colors.white,fontSize: 18 ),)),
        decoration: BoxDecoration(
            color: Color(0xff43A047), borderRadius: BorderRadius.circular(17.r)),
      ),
    );
  }
}
