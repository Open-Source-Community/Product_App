
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/cubit/product.dart';
import 'package:product_app/cubit/product_states.dart';
import 'package:product_app/dark_theme.dart';
import 'package:product_app/view/category/widget/category_item.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => ProductCubit()..getAllProducts(),
      child: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          centerTitle: true,
          title: Text(
            "All",
            style: darkTheme.textTheme.displaySmall,
          ),
        ),
        body: BlocBuilder<ProductCubit, ProductStates>(
          buildWhen: (previous, current) =>
              current is! ProductLoadingPaginationState,
          builder: (context, state) {
            if (state is ProductLoadingState) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            } else if (state is ProductSuccessCategoryState) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    if (notification.metrics.pixels ==
                            notification.metrics.maxScrollExtent &&
                        notification is ScrollUpdateNotification) {
                      BlocProvider.of<ProductCubit>(context)
                          .getAllProducts(paginat: true);
                    }
                    return true;
                  },
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 20,
                      mainAxisExtent: width / 1.8,
                    ),
                    itemBuilder: (context, index) =>
                        index == state.products.length
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.black,
                                ),
                              )
                            : CategoryItem(
                                product: state.products[index],
                              ),
                    itemCount: state.products.length + 1,
                  ),
                ),
              );
            } else {
              return Center(
                child: Text(
                  "failed",
                  style: darkTheme.textTheme.displaySmall,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
