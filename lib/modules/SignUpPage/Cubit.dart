import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:store/share/Cache_Helper/CacheHelper.dart';

import '../../layout_home/home_layout.dart';
import 'States.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitialState());

  static SignUpCubit get(context) => BlocProvider.of(context);

  SignUpMethod({emailAddress, password, context}) async {
    emit(SignUpLoadingState());
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    )
        .then((value) {
      CacheHelper.savedata(key: 'email', value: emailAddress.toString());
      emit(SignUpSuccessState());
      CacheHelper.getdata(key: 'email') == value.user?.uid;
      sendUid(emailAddress);
      Fluttertoast.showToast(
          msg: "Login Successfully!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM_LEFT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0.sp);

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeLayout()));
    }).catchError((error) {
      emit(SignUpErrorState());
    });
  }

  sendUid(email) {
    FirebaseFirestore.instance.collection('user').doc(email).set({
      'email': email,
    }).then((value) {
      emit(SendUidSuccessState());
    });
  }

  Future<UserCredential> signInWithGoogle({context}) async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    debugPrint(FirebaseAuth.instance.currentUser?.email);
    CacheHelper.savedata(
        key: 'email', value: FirebaseAuth.instance.currentUser?.email);
    sendUid(CacheHelper.getdata(key: 'email'));
    Fluttertoast.showToast(
        msg: "Login Successfully!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM_LEFT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0.sp);
    emit(SignGoogleState());

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeLayout()));
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
