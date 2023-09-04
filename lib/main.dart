import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paymob_payment/paymob_payment.dart';
import 'package:store/modules/Cart/Cubit.dart';
import 'package:store/modules/Categorys/Cubit.dart';
import 'package:store/modules/HomePage/HomeCubit/Cubit.dart';
import 'package:store/modules/LoginPage/Cubit.dart';
import 'package:store/modules/LoginPage/LoginPage.dart';
import 'package:store/modules/OrderPage/Cubit.dart';
import 'package:store/modules/Settings/Cubit.dart';
import 'package:store/modules/SignUpPage/Cubit.dart';
import 'package:store/network/Dio/App_Dio.dart';
import 'package:store/share/Cache_Helper/CacheHelper.dart';
import 'package:store/share/Cubit/Cubit.dart';
import 'package:store/share/Cubit/States.dart';

import 'layout_home/home_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  AppDioHelper.init();
  CacheHelper.initcache();
  PaymobPayment.instance.initialize(
    apiKey:
        "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2T0RneE1qUTRMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkuRTlGSTBwbkY3RDV0QThaWE5CeXVJNHM3alN1VjNqakxfT1dYNjdyWDFGX1pXM2dMWGJjMUVQZC1Eek9WaW5RblVkQXlucGN2S2xlRjNMSC0tLXNmMHc=",
    integrationID: 4111769,
    iFrameID: 782244,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, screenUtil) {
        return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => AppCubit(),
              ),
              BlocProvider(
                create: (context) => HomeCubut()..getProductFirebase(),
              ),
              BlocProvider(
                create: (context) => CartCubit(),
              ),
              BlocProvider(
                create: (context) => CategoryCubit(),
              ),
              BlocProvider(
                create: (context) => SettingsCubit(),
              ),
              BlocProvider(
                create: (context) => LoginCubit(),
              ),
              BlocProvider(
                create: (context) => SignUpCubit(),
              ),
              BlocProvider(
                create: (context) => OrderCubit(),
              ),
            ],
            child: BlocConsumer<AppCubit, AppStates>(
              listener: (context, state) {},
              builder: (context, state) {
                return MaterialApp(
                  theme: ThemeData(fontFamily: 'ubuntu'),
                  debugShowCheckedModeBanner: false,
                  home: CacheHelper.getdata(key: 'email') != null
                      ? HomeLayout()
                      : LoginPage(),
                );
              },
            ));
      },
    );
  }
}
