import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:store/helpers/colors.dart';
import 'package:store/layout_home/home_layout.dart';
import 'package:store/modules/Cart/Cubit.dart';
import 'package:store/modules/Cart/States.dart';
import 'package:store/modules/HomePage/HomeCubit/Cubit.dart';
import 'package:store/modules/OrderPage/Cubit.dart';
import 'package:store/modules/OrderPage/States.dart';
import 'package:store/share/Cubit/Cubit.dart';
import 'package:store/share/componant/componant.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit, OrderState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
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
                          title: 'My Order',
                          IconColor: Colors.red,
                          MyPreIcon: Icon(Icons.arrow_back_ios_rounded),
                          fun: () {
                            Navigator.pop(context);
                          },
                        ),
                        InkWell(
                          onTap: () {
                            OrderCubit.get(context).changeOrderButton(0);
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            height: 50.h,
                            width: 150.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.r),
                                color: OrderCubit.get(context).orderButton == 0
                                    ? AppColors.BAR
                                    : Colors.grey.shade300),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.credit_card_rounded,
                                  color:
                                      OrderCubit.get(context).orderButton == 0
                                          ? Colors.white
                                          : Colors.grey.shade700,
                                ),
                                SizedBox(
                                  width: 6.w,
                                ),
                                Text(
                                  'Credit Card',
                                  style: TextStyle(
                                      color:
                                          OrderCubit.get(context).orderButton ==
                                                  0
                                              ? Colors.white
                                              : Colors.grey.shade700,
                                      fontSize: 15.sp),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            OrderCubit.get(context).changeOrderButton(1);
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            height: 50.h,
                            width: 150.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.r),
                                color: OrderCubit.get(context).orderButton == 1
                                    ? AppColors.BAR
                                    : Colors.grey.shade300),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.monetization_on_rounded,
                                  color:
                                      OrderCubit.get(context).orderButton == 1
                                          ? Colors.white
                                          : Colors.grey.shade700,
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                Text(
                                  'Cash',
                                  style: TextStyle(
                                      color:
                                          OrderCubit.get(context).orderButton ==
                                                  1
                                              ? Colors.white
                                              : Colors.grey.shade700,
                                      fontSize: 15.sp),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
