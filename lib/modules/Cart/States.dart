abstract class CartState {}

class CartPageInitialState extends CartState {}

class GetCartSuccessState extends CartState {}

class DeleteCartSuccessState extends CartState {}

class MakeOrderSuccessState extends CartState {}

class MakeOrderLoadingState extends CartState {}

class GetLocationCart extends CartState {}

class GetLocationloadingCart extends CartState {}

class PaymentSuccessState extends CartState {}
