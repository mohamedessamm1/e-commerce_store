import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/modules/Cart/Cubit.dart';
import 'package:store/share/Cache_Helper/CacheHelper.dart';

import 'States.dart';

class HomeCubut extends Cubit<HomeStates> {
  HomeCubut() : super(HomePageInitialState());

  static HomeCubut get(context) => BlocProvider.of(context);

  List products = [];
  List productsId = [];

  Future<void>? getProductFirebase() {
    FirebaseFirestore.instance.collection('products').get().then((value) {
      products = value.docs.map((element) => element.data()).toList();
      productsId = value.docs.map((element) => element.id).toList();

      getStatusProduct();
      emit(GetProductsFirebaseSuccessState());
    }).catchError((error) {});
  }

  addProduct(index, context) {
    getProductsStatus?.update(index, (value) => !value);
    print(getProductsStatus);
    FirebaseFirestore.instance
        .collection('cart')
        .doc(CacheHelper.getdata(key: 'email'))
        .collection(productsId[index])
        .doc('1')
        .set({
      'image': products[index]['image'],
      'price': products[index]['price'],
      'name': products[index]['name'],
      'cart': true,
    }).then((value) {
      CartCubit.get(context).getCart(index, context);
      emit(AddCartSuccessState());
    }).catchError((error) {});
  }

  Map? getProductEntity = {};
  Map? getProductsStatus = {};
  int x = 0;

  getStatusProduct() {
    for (x == 0; x <= products.length; x++) {
      getProductEntity = {x: false};
      getProductsStatus?.addEntries(getProductEntity!.entries);
    }
    print(getProductsStatus);
  }

  int z = 0;

  resetStatusProduct() {
    for (z; z <= products.length; z++) {
      getProductsStatus?.update(z, (value) => false);
      print(getProductsStatus);
    }
    z = 0;
    print(getProductsStatus);
  }
}
