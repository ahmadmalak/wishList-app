import 'package:circular_menu/circular_menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/ui/widgets/wishlist_card.dart';
import '../../core/routing/route_constants.dart';
import '../../core/routing/router.dart';
import '../../repository/wishlist_service.dart';
import 'add_wishlist_screen.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  _WishListScreenState createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  WishListService _wishListService = WishListService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CircularMenu(
        alignment: Alignment.bottomRight,
        toggleButtonColor: Colors.green,
        items: [
          CircularMenuItem(
              icon: Icons.logout,
              color: Colors.red,
              onTap: () {
                pushNamedAndClearStack(context, loginScreenRoute);
              }),
          CircularMenuItem(
            icon: Icons.add,
            color: Colors.purple,
            onTap: () {
              setState(
                () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    context: context,
                    builder: (context) {
                      return AddWishListScreen();
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 80.0.h),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
            child: StreamBuilder(
              stream: _wishListService.fetchWishlists(),
              builder: (_, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                      child: SizedBox(
                          height: 20.h,
                          width: 20.w,
                          child: const CircularProgressIndicator()));
                } else {
                  List<DocumentSnapshot> docs = snapshot.data.docs;
                  if (docs.isEmpty) {
                    return Center(
                      child: Text(
                        'No wishlist found!',
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: docs.length,
                      padding: EdgeInsets.only(
                          left: 25.w, right: 25.w, bottom: 150.h),
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (_, index) => WishListCard(
                        doc: docs[index],
                      ),
                    );
                  }
                }
              },
            ),
          ),
        ]),
      ),
    );
  }
}
