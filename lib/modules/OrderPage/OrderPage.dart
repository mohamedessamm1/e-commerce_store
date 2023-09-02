import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
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
  var buttonCarouselController = CarouselController();
  var CardNumberControler = TextEditingController();
  var validControler = TextEditingController();
  var CVVControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit, OrderState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.grey.shade200,
              body: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 160.w,
                              height: 150.h,
                              child: Stack(
                                children: [
                                  Center(
                                    child: InkWell(
                                      onTap: () {
                                        OrderCubit.get(context)
                                            .changeOrderButton(0);
                                      },
                                      child: AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 250),
                                        height: 100.h,
                                        width: 160.w,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.shade400,
                                                blurRadius: 6.r,
                                                spreadRadius: 0.0.r,
                                                offset: const Offset(
                                                    0, 0), // Shadow position
                                              ),
                                            ],
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    'https://logodownload.org/wp-content/uploads/2016/10/visa-logo-2.png')),
                                            border: Border.all(
                                                color: OrderCubit.get(context)
                                                            .orderButton ==
                                                        0
                                                    ? AppColors.BAR
                                                    : Colors.grey.shade100,
                                                width: 3.w),
                                            borderRadius:
                                                BorderRadius.circular(15.r),
                                            color: Colors.grey.shade100),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      OrderCubit.get(context).orderButton == 0
                                          ? CircleAvatar(
                                              radius: 16.r,
                                              child: Icon(Icons.done_rounded),
                                            )
                                          : Text(''),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            SizedBox(
                              width: 160.w,
                              height: 150.h,
                              child: Stack(
                                children: [
                                  Center(
                                    child: InkWell(
                                      onTap: () {
                                        OrderCubit.get(context)
                                            .changeOrderButton(1);
                                      },
                                      child: AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 250),
                                        height: 100.h,
                                        width: 160.w,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.shade400,
                                                blurRadius: 6.r,
                                                spreadRadius: 0.0.r,
                                                offset: const Offset(
                                                    0, 0), // Shadow position
                                              ),
                                            ],
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    scale: 1.5,
                                                    'https://th.bing.com/th/id/R.74de8dbeb59311a07694ea683d52b90f?rik=xjv3UMVxwjD2Kg&riu=http%3a%2f%2ficons.iconarchive.com%2ficons%2fcustom-icon-design%2fflatastic-11%2f128%2fCash-icon.png&ehk=EV00jDYTFptpmp7tImQYuEjXPy5DChMc6Xd91KW%2fSJM%3d&risl=&pid=ImgRaw&r=0')),
                                            border: Border.all(
                                                color: OrderCubit.get(context)
                                                            .orderButton ==
                                                        1
                                                    ? AppColors.BAR
                                                    : Colors.grey.shade100,
                                                width: 3.w),
                                            borderRadius:
                                                BorderRadius.circular(15.r),
                                            color: Colors.grey.shade100),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      OrderCubit.get(context).orderButton == 1
                                          ? CircleAvatar(
                                              radius: 16.r,
                                              child: Icon(Icons.done_rounded),
                                            )
                                          : Text(''),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        if (OrderCubit.get(context).orderButton == 0) ...{
                          SizedBox(
                            height: 25.h,
                          ),
                          Text(
                            'Card Number ',
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          MyTextFormField(
                              PREICON: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(
                                    'https://achteraf-betalen.nl/wp-content/uploads/2022/12/paypal-2-400x400.png'),
                              ),
                              HINT: '**** **** **** ****',
                              context: context,
                              CONTROLLER: CardNumberControler,
                              COLOR: Colors.white),
                          SizedBox(
                            height: 25.h,
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'valid until ',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  MyTextFormField(
                                      WIDTH: 170.w,
                                      HINT: 'month / year',
                                      context: context,
                                      CONTROLLER: validControler,
                                      COLOR: Colors.white),
                                ],
                              ),
                              SizedBox(
                                width: 15.h,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'CVV ',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  MyTextFormField(
                                      WIDTH: 170.w,
                                      HINT: '***',
                                      context: context,
                                      CONTROLLER: validControler,
                                      COLOR: Colors.white),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Text(
                            'Card Holder ',
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          MyTextFormField(
                              HINT: 'Your Name and Surname',
                              context: context,
                              CONTROLLER: validControler,
                              COLOR: Colors.white),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            children: [
                              Text(
                                'Save card data for future payments ',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Switch(
                                activeColor: Colors.indigo,
                                value: OrderCubit.get(context).SwitchButton,
                                onChanged: (value) {
                                  OrderCubit.get(context)
                                      .ChangeSwitchButton(value);
                                },
                              ),
                            ],
                          ),
                          Divider(color: Colors.grey,),

                          Text('Shipping to :',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16.sp),),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            '${CartCubit.get(context).placemarks?[2].street}  ${CartCubit.get(context).placemarks?[2].locality} ${CartCubit.get(context).placemarks?[2].country}',
                            style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 14.sp,
                                fontWeight:
                                FontWeight.w600),
                          ),
                          Divider(color: Colors.grey,),

                          SizedBox(
                            height: 35.h,
                          ),
                          MainButton(
                            FUNCTION: ()async{
                              showDataAlert(context: context,
                                WIDGETtitle:await Lottie.network(
                                  width: 80.w,
                                    height: 80.h,
                                    'https://lottie.host/1fce2226-0d30-4586-874b-cc231e6e87a6/K0KyNqL8nW.json'),
                                WIDGETcontent: Container(
                                  child: SingleChildScrollView(
                                    padding:  EdgeInsets.all(8.0.w),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Padding(
                                          padding:  EdgeInsets.all(8.0.w),
                                          child: Text(
                                            style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14.sp),
                                            "Your order is Shiping to   \n${CartCubit.get(context).placemarks?[2].street}  ${CartCubit.get(context).placemarks?[2].locality} ${CartCubit.get(context).placemarks?[2].country}",
                                          ),
                                        ),
                                        Divider(color: Colors.grey,),


                                        Padding(
                                            padding:  EdgeInsets.all(8.0),
                                            child: MyButton(function: ()async{
                                              CartCubit.get(context).cartList.clear();
                                              await  CartCubit.get(context).deleteCart();
                                              await  HomeCubut.get(context).resetStatusProduct();
                                              AppCubit.get(context).changebottomnav(0);
                                              Navigator.pop(context);
                                              Navigator.pop(context);
                                            }, text: 'Back Home',fontsize: 14,backgroundcolor: Colors.black)
                                        ),

                                      ],
                                    ),
                                  ),
                                ),



                              );

                            },
                              TEXT: ' Finish Process', COLOR: Colors.green)
                        } else if (OrderCubit.get(context).orderButton ==
                            1) ...{
                          SizedBox(
                            height: 30.h,
                          ),
                          Center(
                            child: Text(
                              'you will pay with cash ',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Divider(color: Colors.grey,),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            'your order = 590\$',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text(
                            'cash pay taxes = 0.99\$ ',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Divider(color: Colors.grey,),

                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            'All Amount = 599\$',
                            style: TextStyle(color: Colors.black,
                                fontSize: 16.sp, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),

                          Divider(color: Colors.grey,),
                          SizedBox(
                            height: 10.h,
                          ),

                          Text('Shipping to :',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16.sp),),
                          SizedBox(
                            height: 5.h,
                          ),

                          Text(
                            '${CartCubit.get(context).placemarks?[2].street}  ${CartCubit.get(context).placemarks?[2].locality} ${CartCubit.get(context).placemarks?[2].country}',
                            style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 14.sp,
                                fontWeight:
                                FontWeight.w600),
                          ),
                          SizedBox(
                            height: 212.h,
                          ),


                          MainButton(
                              FUNCTION: ()async{
                                showDataAlert(context: context,
                                  WIDGETtitle:await Lottie.network(
                                      'https://lottie.host/1fce2226-0d30-4586-874b-cc231e6e87a6/K0KyNqL8nW.json'),
                                  WIDGETcontent: Container(
                                    child: SingleChildScrollView(
                                      padding:  EdgeInsets.all(8.0.w),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Padding(
                                            padding:  EdgeInsets.all(8.0.w),
                                            child: Text(
                                              style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14.sp),
                                              "Your order is Shiping to   \n${CartCubit.get(context).placemarks?[2].street}  ${CartCubit.get(context).placemarks?[2].locality} ${CartCubit.get(context).placemarks?[2].country}",
                                            ),
                                          ),

                                          Padding(
                                              padding:  EdgeInsets.all(8.0),
                                              child: MyButton(function: ()async{
                                                CartCubit.get(context).cartList.clear();
                                                await  CartCubit.get(context).deleteCart();
                                                await  HomeCubut.get(context).resetStatusProduct();
                                                AppCubit.get(context).changebottomnav(0);
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                              }, text: 'Back Home',fontsize: 14,backgroundcolor: Colors.black)
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),



                                );

                              },
                              TEXT: ' Finish Process', COLOR: Colors.green)


                        },
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
