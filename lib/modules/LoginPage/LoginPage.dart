import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:store/helpers/colors.dart';
import 'package:store/layout_home/home_layout.dart';
import 'package:store/modules/SignUpPage/Cubit.dart';
import 'package:store/modules/SignUpPage/SignUpPage.dart';
import 'package:store/share/Cubit/Cubit.dart';
import '../../share/componant/componant.dart';
import 'Cubit.dart';
import 'States.dart';

var FORMKEY = GlobalKey<FormState>();
var emailcontrol = TextEditingController();
var passwordcontrol = TextEditingController();

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 65.h,
                        ),
                        Text(
                          'Hello Again!',
                          style: TextStyle(
                              fontSize: 28.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          'Fill your details or continue with social media',
                          style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Row(
                          children: [
                            Text(
                              'Your Email',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.grey,
                                  height: 3.h),
                            ),
                          ],
                        ),
                        MyTextFormField(
                          COLOR: Colors.grey.shade200,
                            context: context,
                            CONTROLLER: emailcontrol,
                            HINT: '########@gmail.com',
                            PREICON:Icon(Icons.email) ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Row(
                          children: [
                            Text(
                              'Your Password',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.grey,
                                  height: 3.h),
                            ),
                          ],
                        ),
                        MyTextFormField(
                          COLOR: Colors.grey.shade200,
                          textheight: 1.5,
                          suffixTab: () {
                            AppCubit.get(context).ChangePassVisible();
                          },
                          pass: true,
                          context: context,
                          CONTROLLER: passwordcontrol,
                          HINT: '*************',
                          PREICON: Icon(Icons.lock) ,
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            TextButton(
                                onPressed: () {},
                                child: const Text('Forget Password? '))
                          ],
                        ),
                        MainButton(
                            COLOR: Colors.blue.shade700,
                            FUNCTION: () {
                              LoginCubit.get(context).loginMethod(
                                  password: passwordcontrol.text,
                                  emailAddress: emailcontrol.text,
                                  context: context);
                            },
                            TEXT: 'Login'),
                        SizedBox(
                          height: 25.h,
                        ),
                        MainButton(
                            COLOR: Colors.grey.shade200,
                            TEXT_COLOR: Colors.grey.shade800,
                            ICON_COLOR: Colors.blue,
                            ICON: Ionicons.logo_facebook,
                            FUNCTION: () {
                              print('facebook');
                            },
                            TEXT: 'Continue With facebook'),
                        SizedBox(
                          height: 25.h,
                        ),
                        MainButton(
                            COLOR: Colors.grey.shade200,
                            ICON_COLOR: Colors.red,
                            TEXT_COLOR: Colors.grey.shade800,
                            ICON: Ionicons.logo_google,
                            FUNCTION: () async {
                              await SignUpCubit.get(context)
                                  .signInWithGoogle(context: context);
                            },
                            TEXT: 'Continue With Google'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'New User?',
                              style: TextStyle(color: Colors.grey),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration:
                                          const Duration(milliseconds: 1100),
                                      pageBuilder: (context, animation,
                                              secondAnimation) =>
                                          SignUpPage(),
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
                                child: const Text('Create Account'))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        });
  }
}
