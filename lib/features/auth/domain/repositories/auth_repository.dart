import 'package:gh_app/features/auth/domain/usecases/sign_in_usecase.dart';

import '../entities/customer.dart';

abstract class AuthRepository {
  Future<Customer> signIn(SignInParams params);
}
