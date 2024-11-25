import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soute_wasel/Utils/auth_exceptions.dart';
import 'package:soute_wasel/models/user_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  Future<void> getHomeData() async {
    try {
      emit(AuthLoading());
      Future.delayed(const Duration(seconds: 2), () {
        emit(AuthLoaded());
      });
    } on AuthException catch (exp) {
      emit(AuthError(message: exp.message));
    } catch (exp) {
      emit(AuthError(message: exp.toString()));
    }
  }
}
