import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rate/rate.dart';
import 'package:shimmer/shimmer.dart';
import 'package:store/helpers/colors.dart';
import 'package:store/modules/Cart/Cubit.dart';
import 'package:store/modules/HomePage/HomeCubit/Cubit.dart';
import 'package:store/modules/HomePage/HomeCubit/States.dart';
import 'package:store/share/Cubit/Cubit.dart';
import 'package:store/share/componant/componant.dart';

class HomePage extends StatelessWidget {
  var buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubut, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = HomeCubut.get(context).products;
        return Scaffold(
          backgroundColor: Colors.grey.shade100,
          body: RefreshIndicator(child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: ConditionalBuilder(
                    condition: state is! GetItemLoadingState &&
                        HomeCubut.get(context).products.isNotEmpty,
                    builder: (context) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        BarName(
                            title: 'Home',
                            IconColor: AppColors.ButtonColor,
                            MyPreIcon: Icon(Icons.list,color: AppColors.ButtonColor,),
                            fun: () async {
                             await CartCubit.get(context).makeOrder();
                            },
                            MyIcon: Icons.shopping_basket_rounded),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          children: [
                            Text(
                              'Hi Amanda... ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 18.sp,
                              ),
                            ),
                            Spacer(),
                            Container(
                              height: 40.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.deepPurple.shade100,
                                      blurRadius: 6.r,
                                      spreadRadius: 0.0.r,
                                      offset: const Offset(0, 0), // Shadow position
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(15.r),
                                  image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          'https://img.freepik.com/premium-photo/attractive-satisfied-lady-with-pleasant-appearance-beautiful-hair_176532-10297.jpg'))),
                            ),


                          ],
                        ),
                        SizedBox(height: 20.h,),
                        SizedBox(
                          height: 50.h,
                          child: TextFormField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: Icon(
                                  Icons.search,
                                ),
                                hintText: 'Search Here',
                                hintStyle: TextStyle(height: 0.8.h),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(14.r),
                                    borderSide: BorderSide(
                                        color: Colors.transparent)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(14.r),
                                    borderSide: const BorderSide(
                                        color: Colors.red)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(14.r),
                                    borderSide: BorderSide(
                                        color: Colors.transparent)),
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(14.r),
                                    borderSide: BorderSide(
                                        color: Colors.transparent))),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          'Hot Offer',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24.sp,
                          ),
                        ),
                        Image.asset('assets/images/get.png'),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          'Our Products',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24.sp,
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),

                        BuildItem(list, context),
                      ],
                    ),
                    fallback: (context) => ShimmerLoading())),
          ), onRefresh: () async{
            await  HomeCubut.get(context).getStatusProduct();

            await HomeCubut.get(context).getProductFirebase();

          },)
        );
      },
    );
  }
}
