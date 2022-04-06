import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../bloc/login_bloc.dart';

class LoginService {
  Future<void> signInAnonymously(BuildContext context) async {
    try {
   await FirebaseAuth.instance.signInAnonymously();
        Navigator.of(context)
            .push(Provider.of<LoginBloc>(context, listen: false).createRoute());
    } catch (e) {
      print(e); // TODO: show dialog with error
      BotToast.showText(
          text: 'invalid Login  ',
          contentColor: Colors.white,
          textStyle: TextStyle(color: Colors.black));
    }
  }
}
