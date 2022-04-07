import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/repository/wishlist_service.dart';

class AddWishListScreen extends StatefulWidget {
  String itemId;
  String itemText;
  AddWishListScreen({Key? key, this.itemId = '', this.itemText = ''})
      : super(key: key);

  @override
  _AddWishListScreenState createState() => _AddWishListScreenState();
}

class _AddWishListScreenState extends State<AddWishListScreen> {
  TextEditingController _textController = TextEditingController();
  WishListService _wishListService = WishListService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Future<void> onAddButtonPress() async {
    if (_formKey.currentState!.validate()) {
      if (widget.itemId.isEmpty) {
        await _wishListService.createWishlist(
            text: _textController.text.trim());
        Navigator.pop(context);
      } else {
        await _wishListService.editWishlist(
            text: _textController.text.trim(), itemId: widget.itemId);
        Navigator.pop(context);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _textController.text = widget.itemText;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 500.h,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20.0.h),
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  height: 4.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0.w),
                child: Row(children: [
                  Text(
                    'Add new item',
                    style: TextStyle(color: Colors.green, fontSize: 18.sp),
                  ),
                ]),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0.w, right: 20.w, top: 50.h),
                child: TextFormField(
                  onChanged: (String val) {},
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'please enter item name';
                    }
                  },
                  controller: _textController,
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                    hintText: 'item name',
                  ),
                ),
              ),
              SizedBox(
                height: 80.h,
              ),
              GestureDetector(
                onTap: () {
                  onAddButtonPress();
                },
                child: Container(
                  height: 35.h,
                  width: 150.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      color: Colors.green),
                  child: Center(
                    child: Text(
                      widget.itemId.isEmpty ? 'ADD' : 'Edit',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
