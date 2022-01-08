


import 'package:mynotes/feature/domain/entities/note_entity.dart';
import 'package:mynotes/feature/domain/entities/user_entity.dart';
import 'package:mynotes/feature/domain/repositories/firebase_repository.dart';

class GetCreateCurrentUserUseCase {
  final FirebaseRepository repository;

  GetCreateCurrentUserUseCase({required this.repository});

  Future<void> call(UserEntity user)async{
    return repository.getCreateCurrentUser(user);
  }

}