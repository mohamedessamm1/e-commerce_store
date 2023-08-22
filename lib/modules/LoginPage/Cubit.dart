import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:store/modules/Cart/States.dart';
import 'package:store/modules/LoginPage/States.dart';

import '../../layout_home/home_layout.dart';
import '../../share/Cache_Helper/CacheHelper.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginPageInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  loginMethod({emailAddress, password, context}) async {
    emit(LoginSuccessState());

    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailAddress, password: password)
        .then((value) {
      CacheHelper.savedata(key: 'email', value:  emailAddress);
      Fluttertoast.showToast(
          msg: "Login Successfully!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM_LEFT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0.sp);

      emit(LoginSuccessState());

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeLayout()));
      print(value.toString());
    });
  }



}
