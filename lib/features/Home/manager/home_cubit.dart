import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soute_wasel/core/Utils/auth_exceptions.dart';
import 'package:soute_wasel/core/models/category_model.dart';

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

  Future<void> changeCategory(int? selectedCategoryIndex) async {
    try {
      emit(HomePageCategoryChanged(
          selectedCategoryIndex: selectedCategoryIndex));
      if (selectedCategoryIndex == null) {
        getHomeData();
      } else {
        emit(HomeLoading());
        String selectedCategory = categories[selectedCategoryIndex].category;
        // final houses =
        //     await _studentServices.getCategorizedHouses(selectedCategory);
        emit(HomeLoaded());
      }
    } on AuthException catch (exp) {
      emit(HomeError(message: exp.message));
    } catch (exp) {
      emit(HomeError(message: exp.toString()));
    }
  }
  Future<void> changeFavorite(String houseId) async {
    try {
      emit(HomeLoading());
      // String message = await _studentServices.changeFavorite(houseId);
      emit(FavroiteChangedSuccess(message: "message"));
      getHomeData();
    } on AuthException catch (exp) {
      emit(HomeError(message: exp.message));
    } catch (exp) {
      emit(HomeError(message: exp.toString()));
    }
  }
}
