import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/cubit/product.dart';
import 'package:product_app/cubit/product_states.dart';
import 'package:product_app/dark_theme.dart';
import 'package:product_app/view/category/widget/category_item.dart';

class SeeAll extends StatelessWidget {
  const SeeAll({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => ProductCubit()..getGenderProducts(title),
      child: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          centerTitle: true,
          title: Text(
            title,
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
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 20,
                    mainAxisExtent: width / 1.8,
                  ),
                  itemBuilder: (context, index) => CategoryItem(
                    product: state.products[index],
                  ),
                  itemCount: state.products.length,
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
