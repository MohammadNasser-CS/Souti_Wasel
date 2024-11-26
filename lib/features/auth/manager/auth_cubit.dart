import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soute_wasel/core/Utils/auth_exceptions.dart';
import 'package:soute_wasel/core/models/user_model.dart';

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
/**
 * 
 * import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housing_project/Utils/auth_exceptions.dart';
import 'package:housing_project/models/auth_models/owner_auth_model.dart';
import 'package:housing_project/models/auth_models/student_auth_model.dart';
import 'package:housing_project/models/user_model.dart';
import 'package:housing_project/services/auth_services/auth_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final AuthServices _authServices = AuthServicesImplementation();

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      final result = await _authServices.login(email, password);
      if (result) {
        UserModel? user = await _authServices.getUser();
        emit(AuthSuccess(user: user!));
      }
    } on AuthException catch (exp) {
      emit(AuthError(message: exp.message));
    } catch (exp) {
      emit(AuthError(message: 'حصل خلل أثناء عملية إنشاء الحساب'));
    }
  }

  Future<void> ownerRegister(OwnerRegisterModel newOwner) async {
    emit(AuthLoading());
    try {
      final result = await _authServices.ownerRegister(newOwner);
      if (result['isRegistered']) {
        emit(OwnerAuthSuccess(message: result['message']));
        emit(AuthLoaded());
      }
    } on AuthException catch (exp) {
      emit(AuthError(message: exp.message));
    } catch (exp) {
      emit(AuthError(message: exp.toString()));
    }
  }

  Future<void> studentRegister(StudentRegisterModel newStudent) async {
    emit(AuthLoading());
    try {
      final result = await _authServices.studentRegister(newStudent);
      if (result) {
        UserModel? user = await _authServices.getUser();
        emit(AuthSuccess(user: user!));
      }
    } on AuthException catch (exp) {
      emit(AuthError(message: exp.message));
    } catch (exp) {
      emit(AuthError(message: 'حصل خلل أثناء عملية إنشاء الحساب'));
    }
  }

  Future<void> getUser() async {
    try {
      emit(AuthLoading());
      UserModel? user = await _authServices.getUser();
      if (user != null) {
        emit(AuthSuccess(user: user));
      } else {
        emit(AuthError(message: 'تم تسجيل الخروج'));
      }
    } on AuthException catch (e) {
      emit(AuthError(message: e.message));
    } catch (exp) {
      emit(AuthError(message: 'حصل خلل أثناء عملية إنشاء الحساب'));
    }
  }

  Future<void> logout() async {
    emit(AuthLoading());
    try {
      await _authServices.logout();
    } on StateError catch (e) {
      emit(AuthError(message: e.message));
    }
  }

  Future<void> checkAuthStatus() async {
    try {
      UserModel? user = await _authServices.getUser();
      if (user != null) {
        emit(AuthSuccess(user: user));
      } else {
        emit(AuthInitial());
      }
    } catch (e) {
      emit(AuthInitial());
    }
  }
}

 */