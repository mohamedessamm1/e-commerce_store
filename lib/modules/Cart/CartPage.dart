import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:store/helpers/colors.dart';
import 'package:store/modules/Cart/Cubit.dart';
import 'package:store/modules/Cart/States.dart';
import 'package:store/modules/HomePage/HomeCubit/Cubit.dart';
import 'package:store/modules/OrderPage/OrderPage.dart';
import 'package:store/share/Cubit/Cubit.dart';
import 'package:store/share/componant/componant.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {},
        builder: (context, state) {
          List itemlist = CartCubit.get(context).cartList;
          return Scaffold(
            body: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 25.h,
                      ),
                      BarName(
                        title: 'Cart',
                        IconColor: Colors.red,
                        MyPreIcon: Icon(Icons.arrow_back_ios_rounded),
                        fun: () {
                          AppCubit.get(context).changebottomnav(0);
                        },
                        fun2: ()async{
                          CartCubit.get(context).cartList.clear();
                          CartCubit.get(context).deleteCart();
                          HomeCubut.get(context).resetStatusProduct();
                        },
                        MyIcon: Icons.delete,
                      ),
                      SizedBox(
                        height: 35.h,
                      ),
                      Expanded(child: CartItem(itemlist))
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: 670.h,left: 50.w,right: 50.w),
                  child: MainButton(TEXT: 'Make Order',COLOR:Colors.green,FUNCTION: (){
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration:
                        const Duration(milliseconds: 1100),
                        pageBuilder: (context, animation,
                            secondAnimation) =>
                            OrderPage(),
                        transitionsBuilder: (context, animation,
                            secondAnimation, child) {
                          var begin = const Offset(1.0, 0.0);
                          var end = Offset.zero;
                          var curve = Curves.ease;
                          var tween = Tween(
                              begin: begin, end: end)
                              .chain(CurveTween(curve: curve));
                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        },
                      ),
                    );
                  }),
                ),

              ],
            ),
          );
        });
  }
}
