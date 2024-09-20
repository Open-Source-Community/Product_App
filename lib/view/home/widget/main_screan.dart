import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:product_app/cubit/product.dart';
import 'package:product_app/cubit/product_states.dart';
import 'package:product_app/dark_theme.dart';
import 'package:product_app/view/home/widget/clothes_section.dart';
import 'package:product_app/view/home/widget/top_image.dart';

class MainScrean extends StatelessWidget {
  const MainScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit()..getData(),
      child: BlocBuilder<ProductCubit, ProductStates>(
        builder: (context, state) {
          if (state is ProductLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          } else if (state is ProductSuccessState) {
            return SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 400),
                childAnimationBuilder: (widget) => SlideAnimation(
                  verticalOffset: 100,
                  child: FadeInAnimation(
                    child: widget,
                  ),
                ),
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const TopImage(),
                  Section(
                    products: state.electronics,
                    title: "Electronics Category",
                  ),
                  Section(
                    products: state.womenProducts,
                    title: "Women Category",
                  ),
                  Section(
                    products: state.manProducts,
                    title: "Man Category",
                  ),
                ],
              ),
            ));
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
    );
  }
}
