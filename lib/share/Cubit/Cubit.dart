import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/modules/Cart/CartPage.dart';
import 'package:store/modules/Categorys/CategoryPage.dart';
import 'package:store/modules/Settings/Settings.dart';

import '../../modules/HomePage/HomePage.dart';
import 'States.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  /////////////////////////////////////////////////////////////////
  List<Widget> ScreenNavigate = [
    HomePage(),
    CartPage(),
    CategoryPage(),
    SettingsPage(),
  ];

  List<IconData> MyIcons = [
    Icons.home_outlined,
    Icons.monitor_heart_outlined,
    Icons.calendar_month_rounded,
    Icons.medical_services_outlined
  ];

////////////////////////////////////////////////////////////////////////////////
  int CurrentIndex = 0;

  void changebottomnav(index) {
    CurrentIndex = index;
    emit(AppBottomNavChangeState());
  }

  bool myvisible = true;

  ChangePassVisible() {
    myvisible = !myvisible;
    emit(ChangeVisiblePasswordState());
  }
}
