import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:store/modules/Cart/Cubit.dart';
import 'package:store/modules/Cart/States.dart';
import 'package:store/modules/HomePage/HomeCubit/Cubit.dart';
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
                        fun2: () async {
                          CartCubit.get(context).cartList.clear();
                          CartCubit.get(context).deleteCart();
                          CartCubit.get(context).myPrice = 0;
                          HomeCubut.get(context).resetStatusProduct();
                        },
                        MyIcon: Icons.delete,
                      ),
                      itemlist.isEmpty
                          ? Column(
                              children: [
                                SizedBox(
                                  height: 50.h,
                                ),
                                Lottie.network(
                                    'https://lottie.host/8b1627a0-8544-4ae4-abb1-5aa769a19ef4/OXxx64OHBf.json'),
                                Text(
                                  'Cart is Empty',
                                  style: TextStyle(
                                      color: Colors.grey.shade400,
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          : SizedBox(
                              height: 35.h,
                            ),
                      Expanded(child: CartItem(itemlist))
                    ],
                  ),
                ),
                itemlist.isEmpty
                    ? Text('')
                    : Padding(
                        padding: EdgeInsets.only(
                            top: 670.h, left: 50.w, right: 50.w),
                        child: MainButton(
                            TEXT: 'Make Order',
                            COLOR: Colors.green,
                            FUNCTION: () async {
                              await CartCubit.get(context).LocationPermission();
                              await CartCubit.get(context).getLocation();
                              await CartCubit.get(context).getmyaddress();
                              await CartCubit.get(context).PaymentSuccess(
                                context: context,
                              );

                              CartCubit.get(context).cartList.clear();
                              CartCubit.get(context).deleteCart();
                              CartCubit.get(context).myPrice = 0;
                              HomeCubut.get(context).resetStatusProduct();

                              CartCubit.get(context).PaymentResponse == true
                                  ? showDataAlert(
                                      context: context,
                                      WIDGETtitle: await Lottie.network(
                                          'https://lottie.host/1fce2226-0d30-4586-874b-cc231e6e87a6/K0KyNqL8nW.json'),
                                      WIDGETcontent: Container(
                                        child: SingleChildScrollView(
                                          padding: EdgeInsets.all(8.0.w),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.all(8.0.w),
                                                child: Text(
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14.sp),
                                                  "Your order is Shiping to   \n${CartCubit.get(context).placemarks?[2].street}  ${CartCubit.get(context).placemarks?[2].locality} ${CartCubit.get(context).placemarks?[2].country}",
                                                ),
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: MyButton(
                                                      function: () async {
                                                        Navigator.pop(context);
                                                      },
                                                      text: 'ok!',
                                                      fontsize: 14,
                                                      backgroundcolor:
                                                          Colors.black)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  : null;
                            }),
                      )
              ],
            ),
          );
        });
  }
}
