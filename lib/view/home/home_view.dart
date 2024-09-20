import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:product_app/cubit/bottom_nav_bar.dart';
import 'package:product_app/view/cart/cart.dart';
import 'package:product_app/view/home/widget/main_screan.dart';
import 'package:product_app/view/profile.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final List screan = [
    const MainScrean(),
    Container(),
    Container(),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBarCubit(),
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          forceMaterialTransparency: true,
          leading: const Icon(Icons.menu),
          actions: [
            const Icon(Iconsax.search_normal),
            const SizedBox(
              width: 25,
            ),
            IconButton(
              icon: const Icon(Icons.shopping_bag_outlined),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScraen()),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
          ],
        ),
        body: BlocBuilder<BottomNavBarCubit, int>(
          builder: (context, state) {
            return screan[state];
          },
        ),
        bottomNavigationBar: BlocConsumer<BottomNavBarCubit, int>(
          listener: (context, state) {},
          builder: (context, state) {
            return CrystalNavigationBar(
              currentIndex: state,
              unselectedItemColor: Colors.white70,
              backgroundColor: Colors.black,
              onTap: (index) {
                BlocProvider.of<BottomNavBarCubit>(context).setState(index);
              },
              items: [
                CrystalNavigationBarItem(
                  icon: Icons.home,
                  selectedColor: Colors.white,
                ),
                CrystalNavigationBarItem(
                  icon: Icons.search,
                  selectedColor: Colors.white,
                ),
                CrystalNavigationBarItem(
                  icon: Iconsax.save_2,
                  selectedColor: Colors.white,
                ),
                CrystalNavigationBarItem(
                  icon: Iconsax.user,
                  selectedColor: Colors.white,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
