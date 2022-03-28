import '../../../../core/usecases/usecase.dart';
import '../entities/customer.dart';
import '../repositories/auth_repository.dart';

class SignInUseCase extends UseCase<Customer, SignInParams> {
  final AuthRepository repository;

  SignInUseCase({required this.repository});

  @override
  Future<Customer> call(SignInParams params) async {
    return await repository.signIn(params);
  }
}

class SignInParams {
  final String username;
  final String password;

  SignInParams({
    required this.username,
    required this.password,
  });
}
