import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../share/Cubit/Cubit.dart';
import '../share/Cubit/States.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              extendBody: true,
              extendBodyBehindAppBar: true,
              body: AppCubit.get(context)
                  .ScreenNavigate[AppCubit.get(context).CurrentIndex],
              bottomNavigationBar: FloatingNavbar(
                backgroundColor: Colors.blue.shade700,
                elevation: 0,
                selectedItemColor: Colors.blue.shade700,
                width: 330.w,
                itemBorderRadius: 20,
                borderRadius: 20,
                onTap: (int val) {
                  AppCubit.get(context).changebottomnav(val);
                },
                currentIndex: AppCubit.get(context).CurrentIndex,
                items: [
                  FloatingNavbarItem(icon: Icons.home, title: 'Home'),
                  FloatingNavbarItem(
                      icon: Icons.shopping_cart_rounded, title: 'Cart'),
                  FloatingNavbarItem(
                      icon: Icons.category_rounded, title: 'Category'),
                  FloatingNavbarItem(icon: Icons.person, title: 'Settings'),
                ],
              ),
            ),
          );
        });
  }
}
