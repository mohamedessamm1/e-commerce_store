import 'package:draggable_bottom_sheet/draggable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rate/rate.dart';
import 'package:store/modules/HomePage/HomeCubit/Cubit.dart';
import 'package:store/modules/HomePage/HomeCubit/States.dart';
import 'package:store/share/componant/componant.dart';

class ItemDetails extends StatelessWidget {
  String? image;
  String? category;
  String? title;
  var price;
  int? countrate;
  double? rate;
  String? describtion;

  ItemDetails({
    required this.image,
    required this.category,
    required this.title,
    required this.price,
    required this.countrate,
    required this.rate,
    required this.describtion,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubut, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          bottomSheet: DraggableBottomSheet(
            minExtent: 150,
            useSafeArea: false,
            curve: Curves.easeIn,
            previewWidget: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50.r),
                      topLeft: Radius.circular(50.r))),
              child: Padding(
                padding: EdgeInsets.all(10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'swipe up',
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 14.sp),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Text(
                            maxLines: 2,
                            '  \$${price.toString()}',
                            style: TextStyle(
                                fontSize: 22.sp, fontWeight: FontWeight.bold)),
                        Spacer(),
                        Column(
                          children: [
                            Text(
                                maxLines: 1,
                                'Total review - ${countrate.toString()}',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade700)),
                            Rate(
                                iconSize: 14.w,
                                color: Colors.orangeAccent,
                                allowHalf: true,
                                allowClear: true,
                                initialValue: rate!,
                                readOnly: true,
                                onChange: (value) {}),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'colors',
                      style: TextStyle(fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 14.r,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.orange,
                          radius: 14.r,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 14.r,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 14.r,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 14.r,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.green,
                          radius: 14.r,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            expandedWidget: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50.r),
                      topLeft: Radius.circular(50.r))),
              child: Padding(
                padding: EdgeInsets.all(10.w),
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'swipe up',
                          style: TextStyle(
                              color: Colors.grey.shade600, fontSize: 14.sp),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                          maxLines: 2,
                          '  \$${price.toString()}',
                          style: TextStyle(
                              fontSize: 22.sp, fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          const Spacer(),
                          Column(
                            children: [
                              Text(
                                  maxLines: 1,
                                  'Total review - ${countrate.toString()}',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade700)),
                              Rate(
                                  iconSize: 14.w,
                                  color: Colors.orangeAccent,
                                  allowHalf: true,
                                  allowClear: true,
                                  initialValue: rate! + .0,
                                  readOnly: true,
                                  onChange: (value) {}),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        'colors',
                        style: TextStyle(fontSize: 18.sp),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 14.r,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.orange,
                            radius: 14.r,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 14.r,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 14.r,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 14.r,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.green,
                            radius: 14.r,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 28.h,
                      ),
                      Text(
                        maxLines: 1,
                        '   describtion',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade600),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            '  ${describtion.toString()}',
                            style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.w600),
                          )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            backgroundWidget: Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    BarName(
                        title: 'Details',
                        MyIcon: Icons.shopping_cart,
                        IconColor: Colors.blue.shade800,
                        MyPreIcon: Icon(
                          Icons.arrow_back_ios_outlined,
                          color: Colors.blue.shade800,
                        ),
                        fun: () {
                          Navigator.pop(context);
                        }),
                    SizedBox(
                      height: 80.h,
                    ),
                    SizedBox(
                        width: 250.w,
                        height: 300.h,
                        child: Image.network(image.toString())),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      children: [
                        Text('  ${category.toString()}'),
                        const Spacer(),
                        CircleAvatar(
                          radius: 18.r,
                          backgroundColor: Colors.grey.shade100,
                          child: const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      maxLines: 2,
                      '  ${title.toString()}',
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              ),
            ),
            duration: const Duration(milliseconds: 8),
            maxExtent: MediaQuery.of(context).size.height * 0.8,
            onDragging: (pos) {},
            barrierDismissible: true,
          ),
        );
      },
    );
  }
}
