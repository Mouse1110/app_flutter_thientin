part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}
class HomeLoading extends HomeState {}
class HomeLoaded extends HomeState {
    const HomeLoaded({required this.user});
  final Campaign user;

  @override
  List<Object> get props => [user];
}
class HomeError extends HomeState {
    final Failure failure;
  const HomeError({required this.failure});

  @override
  List<Object> get props => [failure];
}

 
