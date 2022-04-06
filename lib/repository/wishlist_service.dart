import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

class WishListService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  var wishListId = Uuid().v4();

  //Create WishList
  Future<void> createWishlist({required String text}) async {
    _firebaseFirestore.collection("WishList").doc(wishListId).set(
      {
        'wishListId': wishListId,
        'text': text,
        'date': DateFormat('yyyy-MM-dd').format(DateTime.now()).toString(),
      },
    );
  }

  //Edit WishList
  Future<void> editWishlist(
      {required String text, required String itemId}) async {
    _firebaseFirestore.collection("WishList").doc(itemId).update({
      'text': text,
      'date': DateFormat('yyyy-MM-dd').format(DateTime.now()).toString(),
    });
  }

  //Fetch WishList
  Stream<QuerySnapshot> fetchWishlists() => _firebaseFirestore
      .collection('WishList')
      .orderBy('date', descending: true)
      .snapshots();

  //Delete WishList
  Future<void> deleteWishList(String wishListId) async {
    _firebaseFirestore.collection('WishList').doc(wishListId).delete();
  }
}
