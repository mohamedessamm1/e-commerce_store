import 'package:cherry_toast/resources/arrays.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/helpers/colors.dart';
import 'package:store/modules/Settings/Cubit.dart';
import 'package:store/share/Cubit/Cubit.dart';
import 'package:store/share/Cubit/States.dart';
import 'package:store/share/componant/componant.dart';
import 'package:store/share/constants/constants.dart';

import '../MyWallet/MyWallet.dart';
import 'States.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey.shade200,
          body: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 250.h,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(50))),
                  ),
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30.h,
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            CircleAvatar(
                              radius: 61.5.r,
                              backgroundColor: Colors.white,
                            ),
                            CircleAvatar(
                              radius: 60.r,
                              backgroundImage: NetworkImage(
                                  'https://img.freepik.com/premium-photo/attractive-satisfied-lady-with-pleasant-appearance-beautiful-hair_176532-10297.jpg'),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          'Amanda',
                          style:
                              TextStyle(color: Colors.white, fontSize: 20.sp),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          width: 340.w,
                          height: 450.h,
                          decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(20.r),
                              color: Colors.white),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 40.h,
                              ),
                              InkWell(
                                onTap: () async {
                                  await SettingsCubit.get(context)
                                      .LocationPermission();
                                  await SettingsCubit.get(context)
                                      .getLocation();
                                  await SettingsCubit.get(context)
                                      .getmyaddress();
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.blue.shade400,
                                        borderRadius:
                                            BorderRadius.circular(10.r)),
                                    width: 300.w,
                                    height: 55.h,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        const Icon(
                                          Icons.location_on_sharp,
                                          color: Colors.white,
                                        ),
                                        const Spacer(),
                                        ConditionalBuilder(
                                            condition:
                                                state is! GetLocationloading,
                                            builder: (context) {
                                              return Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'My Address',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  SizedBox(
                                                    height: 5.h,
                                                  ),
                                                  if (SettingsCubit.get(context)
                                                          .placemarks ==
                                                      null) ...{
                                                    Text(
                                                      'press to access your location',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16.sp,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  } else ...{
                                                    Text(
                                                      '${SettingsCubit.get(context).placemarks?[2].street}  ${SettingsCubit.get(context).placemarks?[2].locality} ${SettingsCubit.get(context).placemarks?[2].country}',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  }
                                                ],
                                              );
                                            },
                                            fallback: (context) => SizedBox(
                                                  width: 200,
                                                  height: 2,
                                                  child:
                                                      LinearProgressIndicator(
                                                    color: Colors.white,
                                                    backgroundColor:
                                                        Colors.blue.shade400,
                                                  ),
                                                )),
                                        const Spacer(),
                                        SizedBox(
                                          width: 30.w,
                                        )
                                      ],
                                    )),
                              ),
                              SizedBox(
                                height: 25.h,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration:
                                          const Duration(milliseconds: 1100),
                                      pageBuilder: (context, animation,
                                              secondAnimation) =>
                                          MyWallet(),
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
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.blue.shade400,
                                        borderRadius:
                                            BorderRadius.circular(10.r)),
                                    width: 300.w,
                                    height: 55.h,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        const Icon(
                                          Icons.wallet,
                                          color: Colors.white,
                                        ),
                                        const Spacer(),
                                        Text(
                                          'My Wallet',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const Spacer(),
                                        const Icon(
                                          Icons.navigate_next_rounded,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        )
                                      ],
                                    )),
                              ),
                              SizedBox(
                                height: 25.h,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.blue.shade400,
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  width: 300.w,
                                  height: 55.h,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      const Icon(
                                        Icons.shopping_basket_rounded,
                                        color: Colors.white,
                                      ),
                                      const Spacer(),
                                      Text(
                                        'My Orders',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const Spacer(),
                                      const Icon(
                                        Icons.navigate_next_rounded,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      )
                                    ],
                                  )),
                              SizedBox(
                                height: 50.w,
                              ),

                              const Text('Contact with us'),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      SettingsCubit.get(context)
                                          .launchUrllfacebook();
                                    },
                                    child: SizedBox(
                                        width: 60.w,
                                        height: 60.h,
                                        child: const Icon(
                                          Icons.facebook,
                                          color: Colors.blue,
                                          size: 40,
                                        )),
                                  ),
                                  SizedBox(
                                    width: 25.w,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      SettingsCubit.get(context)
                                          .launchUrllwhats();
                                    },
                                    child: SizedBox(
                                        width: 35.w,
                                        height: 35.h,
                                        child: Image.network(
                                            'https://th.bing.com/th/id/R.c19c4d4c58f6357c709f8798cbe2ac8a?rik=f%2b5Q9TyNj8bGfg&pid=ImgRaw&r=0')),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
