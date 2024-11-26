part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {}

final class HomeError extends HomeState {
  final String message;
  HomeError({
    required this.message,
  });
}
final class HomePageCategoryChanged extends HomeState{
  final int ?selectedCategoryIndex;
   HomePageCategoryChanged({this.selectedCategoryIndex});
}
final class FavroiteChangedSuccess extends HomeState {
  final String message;
   FavroiteChangedSuccess({required this.message});
}