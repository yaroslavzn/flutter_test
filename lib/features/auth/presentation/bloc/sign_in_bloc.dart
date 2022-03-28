import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/usecases/sign_in_usecase.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInUseCase signInUseCase;

  SignInBloc({required this.signInUseCase}) : super(SignInState()) {
    on<SignInSubmit>(_signInSubmitHandler);
  }

  _signInSubmitHandler(event, emit) async {
    emit(state.copyWith(status: SignInStatus.loading));

    try {
      // final result = await signInUseCase(event.params);
      await Future.delayed(
        const Duration(seconds: 2),
      );
      emit(state.copyWith(status: SignInStatus.success));
    } on Exception {
      emit(state.copyWith(status: SignInStatus.failure));
    }
  }
}
