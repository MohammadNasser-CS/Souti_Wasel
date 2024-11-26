import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soute_wasel/core/Utils/auth_exceptions.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  Future<void> getHomeData() async {
    try {
      emit(HomeLoading());
      Future.delayed(const Duration(seconds: 2), () {
        emit(HomeLoaded());
      });
    } on AuthException catch (exp) {
      emit(HomeError(message: exp.message));
    } catch (exp) {
      emit(HomeError(message: exp.toString()));
    }
  }
}
