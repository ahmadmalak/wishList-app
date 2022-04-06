import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_app/repository/login_service.dart';

import '../../bloc/login_bloc.dart';
import '../widgets/app_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginService _loginService = LoginService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: ScreenUtil().screenHeight,
            width: ScreenUtil().screenWidth,
            child: Image.asset(
              'assets/images/wishlist_background.png',
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0.w, vertical: 110.h),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text(
                'WishList Tracker',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 50.h,
              ),
              Padding(
                padding: EdgeInsets.only(top: 250.0.h),
                child: AppButton(
                  onTaps: () => _loginService.signInAnonymously(context),
                  text: 'Sign In Anonymously',
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
