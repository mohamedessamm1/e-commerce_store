import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:store/modules/Categorys/States.dart';
import 'package:store/modules/OrderPage/States.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderPageInitialState());

  static OrderCubit get(context) => BlocProvider.of(context);

  int orderButton=0;
  changeOrderButton(value){
    orderButton=value;
    print(value);
    emit(ChangeOrderButtonState());
  }
 bool SwitchButton=false;
  ChangeSwitchButton(value){
    SwitchButton=value;
    emit(ChangeSwitchButtonState());
  }


}
