part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

class UserFailureState extends UserState {
  @override
  List<Object> get props => [];
}
class UserLoadingState extends UserState {
  @override
  List<Object> get props => [];
}
class UserSuccessState extends UserState {
  @override
  List<Object> get props => [];
}
