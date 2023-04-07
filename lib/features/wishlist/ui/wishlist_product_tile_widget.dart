import 'package:flutter/material.dart';
import 'package:learning_bloc/features/home/models/home_product_data_model.dart';
import 'package:learning_bloc/features/wishlist/bloc/wishlist_bloc.dart';

class WishlistProductTile extends StatelessWidget {
  final ProductDataModel productDataModel;
  final WishlistBloc wishlistBloc;
  const WishlistProductTile(
      {super.key, required this.productDataModel, required this.wishlistBloc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 200,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(productDataModel.imgaeUrl))),
              ),
              Text(
                productDataModel.name,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              Text(productDataModel.description),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$ ${productDataModel.price.toString()}',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {
                        wishlistBloc.add(WishlistRemoveFromWishlistEvent(
                            productDataModel: productDataModel));
                      },
                      icon: const Icon(Icons.favorite)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
