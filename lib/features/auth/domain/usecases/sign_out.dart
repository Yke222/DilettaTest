import 'package:wishlist/features/auth/domain/repositories/auth_repository.dart';
import 'package:wishlist/utils/usecases/usecase.dart';

class SignOutUseCase implements UseCase<void, Map<String, dynamic>> {
  final AuthRepository _authRepository;

  SignOutUseCase(this._authRepository);

  @override
  Future<void> call({Map<String, dynamic>? params}) {
    return _authRepository.signOut();
  }
}
