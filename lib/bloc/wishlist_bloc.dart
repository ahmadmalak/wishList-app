
import 'package:flutter/cupertino.dart';

class WishListBloc  with ChangeNotifier {
   String _text='';
  String get text => _text;
  setName(String text) {
    _text = text;
    notifyListeners();
  }

}