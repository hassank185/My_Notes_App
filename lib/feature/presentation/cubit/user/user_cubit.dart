import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mynotes/feature/domain/entities/user_entity.dart';
import 'package:mynotes/feature/domain/use_cases/get_create_current_user_usecase.dart';
import 'package:mynotes/feature/domain/use_cases/sign_in_usecase.dart';
import 'package:mynotes/feature/domain/use_cases/sign_up_usecase.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;
  final GetCreateCurrentUserUseCase getCreateCurrentUserUseCase;

  UserCubit({
    required this.getCreateCurrentUserUseCase,
    required this.signUpUseCase,
    required this.signInUseCase,
  }) : super(UserInitial());

  Future<void> submitSignIn({required UserEntity user}) async {
    emit(UserLoadingState());
    try {
      await signInUseCase.call(user);
      emit(UserSuccessState());
    } on SocketException catch (_) {
      emit(UserFailureState());
    } catch (_) {
      emit(UserFailureState());
    }
  }

  Future<void> submitSignUp({required UserEntity user}) async {
    emit(UserLoadingState());
    try {
      await signUpUseCase.call(user);
      await getCreateCurrentUserUseCase.call(user);
      emit(UserSuccessState());
    } on SocketException catch (_) {
      emit(UserFailureState());
    } catch (_) {
      emit(UserFailureState());
    }
  }
}
