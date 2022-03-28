part of 'sign_in_bloc.dart';

enum SignInStatus { initial, loading, failure, success }

class SignInState {
  final SignInStatus status;

  SignInState({this.status = SignInStatus.initial});

  SignInState copyWith({SignInStatus? status}) {
    return SignInState(status: status ?? this.status);
  }
}

// class SignInInitial extends SignInState {}

// class SignInLoading extends SignInState {}

// class SignInFailure extends SignInState {}

// class SignInSuccess extends SignInState {}
