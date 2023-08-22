import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:rate/rate.dart';
import 'package:shimmer/shimmer.dart';
import 'package:store/modules/HomePage/HomeCubit/Cubit.dart';
import 'package:store/modules/ItemDetails/ItemDetails.dart';
import 'package:store/share/Cubit/Cubit.dart';

import '../../helpers/colors.dart';


  Widget BuildItem(list, context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 5.h,
          ),
          Container(
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 20.h,
              children: List.generate(
                  HomeCubut.get(context).products.length,
                  (index) => InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 1100),
                              pageBuilder:
                                  (context, animation, secondAnimation) =>
                                      ItemDetails(
                                image: list[index]['image'],
                                category: list[index]['category'],
                                title: list[index]['name'],
                                price: list[index]['price'],
                                countrate: list[index]['totalrate'],
                                rate: list[index]['rate'] + .0,
                                describtion: list[index]['describtion'],
                              ),
                              transitionsBuilder:
                                  (context, animation, secondAnimation, child) {
                                var begin = const Offset(1.0, 0.0);
                                var end = Offset.zero;
                                var curve = Curves.ease;
                                var tween = Tween(begin: begin, end: end)
                                    .chain(CurveTween(curve: curve));
                                return SlideTransition(
                                  position: animation.drive(tween),
                                  child: child,
                                );
                              },
                            ),
                          );
                        },
                        child: Stack(
                          children: [
                            Container(width: 180.w),
                            Container(
                              height: 190.h,
                              width: 160.w,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.r)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Icon(Icons.favorite_border_rounded),
                                  ),
                                  Center(
                                      child: Image.network(
                                    '${list[index]['image']}',
                                    width: 100.w,
                                    height: 100.h,
                                  )),
                                  Text(
                                    maxLines: 1,
                                    '  ${list[index]['name']}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text(
                                        '\$${list[index]['price']}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 25.w,
                                      ),
                                      Rate(
                                          iconSize: 14.w,
                                          color: Colors.orangeAccent,
                                          allowHalf: true,
                                          allowClear: true,
                                          initialValue:
                                              list[index]['rate'] + .0,
                                          readOnly: true,
                                          onChange: (value) {}),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            HomeCubut.get(context).getProductsStatus?[index]?

                                 Positioned(
                                   height: 65.h,
                                    width: 280.w,
                                    child: Lottie.network(
                                        'https://lottie.host/fd203756-884a-410d-9eaf-7247a557e92d/j0PIPvixes.json',repeat: false)):
                            Positioned(
                                width: 315.w,
                                child: InkWell(
                                  onTap: () {
                                    HomeCubut.get(context)
                                        .addProduct(index, context);
                                  },
                                  child: CircleAvatar(
                                    radius: 18.r,
                                    backgroundColor: AppColors.ButtonColor,
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      )),
            ),
          ),
        ],
      );

  Widget BarName({
    Widget? MyPreIcon,
    IconData? MyIcon,
    Function()? fun,
    Function()? fun2,
    Color? IconColor,
    Color? barcolor = Colors.white,
    String? title = '',
  }) =>
      Container(
        width: double.infinity,
        height: 48.h,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.blue.shade50,
            blurRadius: 12.r,
            spreadRadius: 0.1.r,
            offset: const Offset(0, 0), // Shadow position
          ),
        ], color: barcolor, borderRadius: BorderRadius.circular(12.r)),
        child: Row(
          children: [
            SizedBox(
              width: 5.h,
            ),
            IconButton(onPressed: fun, icon: MyPreIcon!),
            const Spacer(),
            Text(
              '${title}',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            const Spacer(),
            IconButton(
                onPressed: fun2,
                icon: Icon(
                  MyIcon,
                  color: IconColor,
                )),
            SizedBox(
              width: 5.h,
            ),
          ],
        ),
      );

  Widget ShimmerLoading() => SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            BarName(
                IconColor: AppColors.ButtonColor,
                MyPreIcon: Icon(Icons.list),
                fun: () {},
                MyIcon: Icons.shopping_basket_rounded),
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
              height: 20.h,
            ),
            SizedBox(
              height: 50.h,
              child: TextFormField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.second,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey.shade700,
                    ),
                    hintText: 'Search Here',
                    hintStyle: TextStyle(height: 0.8.h),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.r),
                        borderSide: BorderSide(color: Colors.grey.shade300)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.r),
                        borderSide: const BorderSide(color: Colors.red)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.r),
                        borderSide: BorderSide(color: Colors.grey.shade300)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.r),
                        borderSide: BorderSide(color: Colors.grey.shade300))),
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
            Container(
              height: 150.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.Primary,
                  borderRadius: BorderRadius.circular(22.r)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Center(
                      child: Text(
                    'Get 50% Off',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold),
                  )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Shimmer.fromColors(
              period: const Duration(milliseconds: 650),
              baseColor: Colors.grey.shade400,
              highlightColor: Colors.grey.shade300,
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 20.h,
                crossAxisSpacing: 20.w,
                children: List.generate(
                    6,
                    (index) => InkWell(
                          child: Container(
                            height: 170.h,
                            width: 160.w,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.r)),
                          ),
                        )),
              ),
            ),
          ],
        ),
      );

  Widget CartItem(myList) => ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) => Container(
            width: double.infinity,
            height: 120.h,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 6.r,
                  spreadRadius: 0.0.r,
                  offset: const Offset(0, 0), // Shadow position
                ),
              ],
              borderRadius: BorderRadius.circular(15.r),
              color: Colors.white,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 10.w,
                ),
                SizedBox(
                  width: 105.w,
                  height: 100.h,
                  child: Image.network(
                    '${myList[index]['image']}',
                  ),
                ),
                SizedBox(
                  width: 2.w,
                ),
                Container(
                  width: 170.w,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        '${myList[index]['name']}',
                        style: TextStyle(color: Colors.black, fontSize: 18.sp),
                      ),
                      Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        '\$ ${myList[index]['price']}',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            height: 2),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 18.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      CircleAvatar(
                          radius: 16.r,
                          backgroundColor: AppColors.ButtonColor,
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          )),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text('${Random().nextInt(6)}'),
                      SizedBox(
                        height: 5.h,
                      ),
                      CircleAvatar(
                          radius: 16.r,
                          backgroundColor: Colors.red,
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                          )),
                      SizedBox(
                        height: 5.h,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
      separatorBuilder: (Context, index) => SizedBox(
            height: 25.h,
          ),
      itemCount: myList.length);

  Widget ItemCategory(image, title) => Container(
        height: 190.h,
        width: 160.w,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 12.r,
            spreadRadius: 0.0.r,
            offset: const Offset(0, 0), // Shadow position
          ),
        ], color: Colors.white, borderRadius: BorderRadius.circular(20.r)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40.h,
            ),
            Center(
                child: Image.network(
              '${image}',
              width: 190.w,
              height: 100.h,
            )),
            Center(
              child: Text(
                maxLines: 1,
                '  ${title}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.sp,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      );

  Widget MyButton({
    required Function() function,
    required String? text,
    int fontsize = 21,
    Color? fontcolor,
    Color? backgroundcolor,
    Color? iconcolor,
    int heightbutton = 44,
    double iconsize = 44,
    int widthbutton = 350,
    IconData? myicon,
    FontWeight? myfontweight,
    String? myimage,
    double? mywidth,
  }) =>
      ElevatedButton(
        onPressed: function,
        style: ElevatedButton.styleFrom(
            fixedSize: Size(widthbutton.w, heightbutton.h),
            backgroundColor: backgroundcolor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            myicon == null
                ? myimage == null
                    ? Text('')
                    : Image.asset(
                        '${myimage}',
                        scale: 0.7,
                      )
                : Row(
                    children: [
                      Icon(myicon, color: iconcolor, size: iconsize),
                      SizedBox(width: 10.w),
                    ],
                  ),
            SizedBox(
              width: mywidth,
            ),
            Text(
              '$text',
              style: TextStyle(
                  fontSize: fontsize.sp,
                  color: fontcolor,
                  fontWeight: myfontweight),
            ),
          ],
        ),
      );

  Widget MyTextFormField({
    context,
    String? HINT,
    TextEditingController? CONTROLLER,
    IconData? PREICON,
    IconData? SUFICON,
    bool pass = false,
    Function()? suffixTab,
    double textheight = 0.8,
  }) =>
      Container(
        width: double.infinity,
        height: 50.h,
        child: TextFormField(
          textAlign: TextAlign.start,
          obscureText: pass ? AppCubit.get(context).myvisible : false,
          controller: CONTROLLER,
          decoration: InputDecoration(
              suffix: pass
                  ? InkWell(
                      onTap: suffixTab,
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Icon(
                          Icons.remove_red_eye,
                          color: Colors.grey,
                          size: 25,
                        ),
                      ))
                  : Text(''),
              filled: true,
              fillColor: Colors.grey.shade200,
              hintText: HINT,
              contentPadding: EdgeInsets.all(15),
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 16.sp,
                height: textheight.h,
              ),
              prefixIconColor: Colors.grey,
              prefixIcon: Icon(PREICON),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.r),
                  borderSide: BorderSide(color: Colors.transparent)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.r),
                  borderSide: BorderSide(color: Colors.transparent)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.r),
                  borderSide: BorderSide(color: Colors.transparent))),
        ),
      );
  Widget MainButton({
    String? TEXT,
    Function()? FUNCTION,
    IconData? ICON,
    Color COLOR = Colors.grey,
    Color BORDER_COLOR = Colors.transparent,
    Color ICON_COLOR = Colors.white,
    Color TEXT_COLOR = Colors.white,
  }) =>
      InkWell(
        onTap: FUNCTION,
        child: Container(
          width: double.infinity,
          height: 48.h,
          decoration: BoxDecoration(
            border: Border.all(color: BORDER_COLOR),
            color: COLOR,
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ICON != null
                  ? Row(
                      children: [
                        Icon(
                          ICON,
                          color: ICON_COLOR,
                        ),
                        SizedBox(
                          width: 10.w,
                        )
                      ],
                    )
                  : Text(''),
              Text(
                '${TEXT}',
                style: TextStyle(
                    color: TEXT_COLOR,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )),
        ),
      );


