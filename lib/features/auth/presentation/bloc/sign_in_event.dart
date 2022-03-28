part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent {}

class SignInSubmit extends SignInEvent {
  final SignInParams params;

  SignInSubmit({required this.params});
}
