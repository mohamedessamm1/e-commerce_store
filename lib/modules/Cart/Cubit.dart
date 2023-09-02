import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:store/modules/Cart/States.dart';
import 'package:store/modules/HomePage/HomeCubit/Cubit.dart';
import 'package:geocoding/geocoding.dart' as geo;

import '../../share/Cache_Helper/CacheHelper.dart';
import '../../share/constants/constants.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartPageInitialState());

  static CartCubit get(context) => BlocProvider.of(context);
  List getcartlist = [];
  List cartList = [];

  Future<void>? getCart(index, context) {
    FirebaseFirestore.instance
        .collection('cart')
        .doc(CacheHelper.getdata(key: 'email'))
        .collection(HomeCubut.get(context).productsId[index])
        .get()
        .then((value) {
      getcartlist = value.docs.map((element) => element.data()).toList();
      cartList.add(getcartlist[0]);
      print(cartList.toString());
      Favourite?.addAll({
        HomeCubut.get(context).productsId[index]: true,
      });

      emit(GetCartSuccessState());
    }).catchError((error) {
      print(error.toString());
    });
  }

  Map<String, bool>? Favourite = {};

  int deletelenght = 0;
  deleteCart() async{

    await FirebaseFirestore.instance
        .collection('cart')
        .doc(CacheHelper.getdata(key: 'email'))
        .delete()
        .then((value) {
      print('done');

      emit(DeleteCartSuccessState());
    }).catchError((error) {});
  }

  int orderlenght = 0;
  makeOrder() {
    emit(MakeOrderLoadingState());
    for (orderlenght = 0; orderlenght <= cartList.length - 1; orderlenght++) {
      FirebaseFirestore.instance
          .collection('user')
          .doc(CacheHelper.getdata(key: 'email').toString())
          .collection('order')
          .doc("${orderlenght}")
          .set({
        'image': cartList[orderlenght]['image'],
        'price': cartList[orderlenght]['price'],
        'name': cartList[orderlenght]['name'],
      }).then((value) {
        emit(MakeOrderSuccessState());
      });
    }
  }

  Future<void> getOrder() async {
    CollectionReference productsRef = FirebaseFirestore.instance
        .collection('order')
        .doc('order')
        .collection('order');
    final snapshot = await productsRef.get();
    List<Map<String, dynamic>> map =
        snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    print(map);
  }

  Location location = new Location();
  bool? _serviceEnabled;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;

  LocationPermission() async {
    emit(GetLocationloadingCart());

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled!) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled!) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
  }

  double? lat;
  double? long;

  getLocation() async {
    emit(GetLocationloadingCart());

    lat = await _locationData?.latitude;
    long = await _locationData?.longitude;
  }

  List<geo.Placemark>? placemarks;

  getmyaddress() async {
    emit(GetLocationloadingCart());
    placemarks = await geo.placemarkFromCoordinates(lat!, long!);

    emit(GetLocationCart());
  }

}
