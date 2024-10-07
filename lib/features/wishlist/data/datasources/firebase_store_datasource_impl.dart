import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wishlist/features/wishlist/communs/erros/wishlist_erros.dart';
import 'package:wishlist/features/wishlist/data/datasources/firebase_store_datasource.dart';
import 'package:wishlist/features/wishlist/data/models/wish_product_model.dart';
import 'package:wishlist/utils/errors/failure.dart';

class AuthFirebaseWishListDataSourceImpl implements AuthFirebaseWishListDataSource {
  @override
  Future<Either<Failure, WishProductModel>> addProductToWishList(WishProductModel product) async {
    try {
      CollectionReference wishListCollection = FirebaseFirestore.instance.collection('wishList');

      final currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser == null) {
        throw Exception('User not found');
      }

      product = product.copyWith(userId: currentUser.uid);

      final docRef = await wishListCollection.add(product.toFirestore());

      final docSnapshot = await docRef
          .withConverter(
            fromFirestore: (snapshot, options) => WishProductModel.fromFirestore(snapshot, options),
            toFirestore: (wishProductModel, _) => wishProductModel.toFirestore(),
          )
          .get();

      final wishProduct = docSnapshot.data();

      if (wishProduct == null) {
        return Left(Failure('Error adding product to wish list'));
      }

      return Right(wishProduct);
    } catch (e) {
      return Left(Failure(AddProductException()));
    }
  }

  @override
  Future<Either<Failure, List<WishProductModel>>> fetchProducts() async {
    try {
      CollectionReference wishListCollection = FirebaseFirestore.instance.collection('wishList');

      final currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser == null) {
        return const Right([]);
      }

      Query query = wishListCollection.where('userId', isEqualTo: currentUser.uid);

      final wishList = await query
          .withConverter(
            fromFirestore: (snapshot, options) => WishProductModel.fromFirestore(snapshot, options),
            toFirestore: (wishProductModel, _) => wishProductModel.toFirestore(),
          )
          .get();

      final wishListProducts = wishList.docs.map((e) => e.data()).toList();

      return Right(wishListProducts);
    } catch (e) {
      log('Error fetching products: $e');
      return Left(Failure(SearchProductsException()));
    }
  }

  @override
  Future<Either<Failure, bool>> removeProductFromWishList(int productId) async {
    try {
      CollectionReference wishListCollection = FirebaseFirestore.instance.collection('wishList');

      final currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser == null) {
        throw Exception('User not found');
      }

      final docRef = wishListCollection
          .where(
            'userId',
            isEqualTo: currentUser.uid,
          )
          .where(
            'product.id',
            isEqualTo: productId,
          )
          .limit(1)
          .withConverter(
            fromFirestore: (snapshot, options) => WishProductModel.fromFirestore(snapshot, options),
            toFirestore: (wishProductModel, _) => wishProductModel.toFirestore(),
          )
          .get();

      final value = docRef.then((value) async {
        if (value.docs.isEmpty) {
          return false;
        }

        final docId = value.docs.first.id;

        await wishListCollection.doc(docId).delete();

        return true;
      });

      return value.then((value) => Right(value));
    } catch (e) {
      return Left(Failure(RemoveProductException()));
    }
  }
}
