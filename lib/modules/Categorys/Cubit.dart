import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/modules/Categorys/States.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryPageInitialState());

  static CategoryCubit get(context) => BlocProvider.of(context);
}
