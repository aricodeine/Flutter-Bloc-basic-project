import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:learning_bloc/data/wishlist_items.dart';
import 'package:learning_bloc/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistRemoveFromWishlistEvent>(wishlistRemoveFromWishlistEvent);
  }

  FutureOr<void> wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistSuccessState(wishlistItems: wishlistItems));
  }

  FutureOr<void> wishlistRemoveFromWishlistEvent(
      WishlistRemoveFromWishlistEvent event, Emitter<WishlistState> emit) {
    wishlistItems.remove(event.productDataModel);
    emit(WishlistProductRemovedFromWishlistActionState());
    emit(WishlistSuccessState(
        wishlistItems:
            wishlistItems)); //to notify my ui part that the product has been removed from the wishlist and now the ui needs rebuilding
    // here we are using the same WishlistSuccessState because since it is of type WishlistState, we do not need to create another one of these.
    // we can just reuse it
  }
}
