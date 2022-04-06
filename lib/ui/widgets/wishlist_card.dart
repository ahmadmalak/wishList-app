import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/ui/home/add_wishlist_screen.dart';
import '../../repository/wishlist_service.dart';
import 'dialog_widget.dart';

class WishListCard extends StatelessWidget {
  final DocumentSnapshot doc;
  WishListCard({Key? key, required this.doc}) : super(key: key);
  WishListService _wishListService = WishListService();
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green,
      child: ListTile(
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
                onTap: () =>      showModalBottomSheet(
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          context: context,
          builder: (context) {
            return AddWishListScreen(
              itemId: doc['wishListId'],
              itemText: doc['text'],
            );
          }),
                child: Icon(Icons.edit)),
            SizedBox(
              width: 15.w,
            ),
            GestureDetector(
                onTap: () {
                  nativePopUp(
                      context: context,
                      title: 'Are you sure you want to delete this wishlist?',
                      confirmButtonActionName: "YES",
                      rejectButtonActionName: 'NO',
                      onCancel: () =>
                          Navigator.of(context, rootNavigator: true).pop(this),
                      content: "this is action can't be undo",
                      onConfirm: () {
                        _wishListService.deleteWishList(doc['wishListId']);
                        Navigator.of(context, rootNavigator: true).pop(this);
                      });
                },
                child: Icon(Icons.delete))
          ],
        ),
        title: SizedBox(
          width: 250.w,
          child: Text(
            doc['text'],
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        subtitle: Text(
          doc['date'].toString(),
          style:
              TextStyle(fontSize: 12.sp, color: Colors.black.withOpacity(0.5)),
        ),
      ),
    );
  }
}
