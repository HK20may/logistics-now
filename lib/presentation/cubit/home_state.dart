part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeData extends HomeState {
  final DateTime id;
  const HomeData({required this.id});

  @override
  List<Object> get props => [id];
}
