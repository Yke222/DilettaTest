import 'package:wishlist/features/auth/domain/repositories/auth_repository.dart';
import 'package:wishlist/features/user/domain/entities/user_entity.dart';
import 'package:wishlist/utils/usecases/usecase.dart';

class SignInEmailAndPasswordUseCaseParams {
  final String email;
  final String password;

  SignInEmailAndPasswordUseCaseParams(this.email, this.password);
}

class SignInEmailAndPasswordUseCase
    implements UseCase<UserEntity, SignInEmailAndPasswordUseCaseParams> {
  final AuthRepository _authRepository;

  SignInEmailAndPasswordUseCase(this._authRepository);

  @override
  Future<UserEntity> call({SignInEmailAndPasswordUseCaseParams? params}) async {
    if (params == null) {
      throw Exception('Params cannot be null');
    }
    return await _authRepository.signInWithEmailAndPassword(params.email, params.password);
  }
}
