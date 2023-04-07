import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:learning_bloc/data/product_data.dart';
import 'package:learning_bloc/data/wishlist_items.dart';
import 'package:learning_bloc/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeToHeartNavigateEvent>(heartNavigateEvent);
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlistButtonClickedEvent>(homeProductWishlistButtonClickedEvent);
  }

  Future<FutureOr<void>> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(
        seconds: 3)); // hear you can replace this with any database method call.
    emit(HomeLoadedSuccessState(GroceryData.groceryProducts
        .map((e) => ProductDataModel(
            id: e['id'],
            name: e['name'],
            description: e['description'],
            price: e['price'],
            imgaeUrl: e['imageUrl']))
        .toList()));
  }

  FutureOr<void> heartNavigateEvent(
      HomeToHeartNavigateEvent event, Emitter<HomeState> emit) {
    print('Navigating to heart page');
    emit(HomeNavigateToHeartPageActionState());
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    wishlistItems.add(event.clickedProduct);
    // print('add to wishlist button clicked');
    emit(HomeProductItemWishlistedActionState());
  }
}
