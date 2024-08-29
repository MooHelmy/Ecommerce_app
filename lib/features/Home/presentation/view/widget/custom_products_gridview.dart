import 'package:ecommerce_app/features/Favorites/presentation/manager/cubit/favorite_cubit.dart';
import 'package:ecommerce_app/features/Home/presentation/manager/cubit/products_categories_cubit.dart';
import 'package:ecommerce_app/features/Home/presentation/view/item_info_view.dart';
import 'package:ecommerce_app/features/Home/presentation/view/widget/custom_gridview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class CustomProductsGridView extends StatelessWidget {
  const CustomProductsGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllProductsCubit, ProductsCubitState>(
      builder: (context, state) {
        if (state is GetProductsSuccess) {
          return Expanded(
            child: GridView.builder(
              itemCount: state.products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 65,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return CustomGridViewItem(
                  onTap: () {
                    Get.to(ItemInfoView(productModel: state.products[index]));
                  },
                  icoOntap: () {
                    BlocProvider.of<FavoriteCubit>(context)
                        .addProductToFavorites(product: state.products[index]);
                  },
                  productModel: state.products[index],
                );
              },
            ),
          );
        } else if (state is GetProductsFauiler) {
          return Center(child: Text(state.messagEerror));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
