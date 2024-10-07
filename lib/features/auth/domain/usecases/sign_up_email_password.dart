import 'package:wishlist/features/auth/domain/repositories/auth_repository.dart';
import 'package:wishlist/features/user/domain/entities/user_entity.dart';
import 'package:wishlist/utils/usecases/usecase.dart';

class SignUpEmailAndPasswordUseCaseParams {
  final String email;
  final String password;

  SignUpEmailAndPasswordUseCaseParams(this.email, this.password);
}

class SignUpEmailAndPasswordUseCase
    implements UseCase<UserEntity, SignUpEmailAndPasswordUseCaseParams> {
  final AuthRepository _authRepository;

  SignUpEmailAndPasswordUseCase(this._authRepository);

  @override
  Future<UserEntity> call({SignUpEmailAndPasswordUseCaseParams? params}) async {
    if (params == null) {
      throw Exception('Params cannot be null');
    }
    return await _authRepository.signUpWithEmailAndPassword(params.email, params.password);
  }
}
