import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/cubit/Password_states.dart';

class PasswordCubit extends Cubit<PasswordStates> {
  PasswordCubit() : super(PasswordStates());
  bool visible = false;
  bool isPassword = true;
  void changeState() {
    visible = !visible;
    isPassword = !isPassword;
    emit(ChangePasswordState());
  }
}
