import '../../domain/entities/customer.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/sign_in_usecase.dart';
import '../datasources/remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RemoteDataSource dataSource;

  AuthRepositoryImpl({required this.dataSource});

  @override
  Future<Customer> signIn(SignInParams params) async {
    return await dataSource.signIn(params);
  }
}
