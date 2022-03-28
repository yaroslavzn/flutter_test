import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../../../core/validators/validators.dart';
import '../../../casino/presenation/screens/all_games_screen.dart';
import '../../data/datasources/remote_data_source.dart';
import '../../data/repository/auth_repository_impl.dart';
import '../../domain/usecases/sign_in_usecase.dart';
import '../bloc/sign_in_bloc.dart';

class SignInScreen extends StatefulWidget {
  static String routePath = '/sign-in';
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordFocusNode = FocusNode();
  final _key = GlobalKey<FormState>();

  BlocListener<SignInBloc, SignInState> _buildSignInForm() {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        final messenger = ScaffoldMessenger.of(context);
        if (state.status == SignInStatus.success) {
          final snackBar = SnackBar(
            backgroundColor: Colors.green.shade400,
            content: const Text(
              'You\'ve successfully signed in',
              style: TextStyle(color: Colors.white),
            ),
          );
          messenger.showSnackBar(snackBar);
          Navigator.of(context)
              .pushReplacementNamed(CasinoGamesScreen.routePath);
        } else if (state.status == SignInStatus.failure) {
          final snackBar = SnackBar(
            backgroundColor: Colors.red.shade500,
            content: const Text(
              'Sign In Error',
              style: TextStyle(color: Colors.white),
            ),
            action: SnackBarAction(
              label: 'Close',
              onPressed: () => ScaffoldMessenger.of(context).clearSnackBars(),
              textColor: Colors.white,
            ),
          );
          messenger.showSnackBar(snackBar);
        }
      },
      child: BlocBuilder<SignInBloc, SignInState>(
        builder: (context, state) {
          if (state.status == SignInStatus.initial ||
              state.status == SignInStatus.failure) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Form(
                  key: _key,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Email',
                        ),
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        validator: Validators.email,
                        onFieldSubmitted: (value) => {
                          if (_passwordController.text.isEmpty)
                            {_passwordFocusNode.requestFocus()}
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Password',
                        ),
                        focusNode: _passwordFocusNode,
                        obscureText: true,
                        controller: _passwordController,
                        validator: Validators.password,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      BlocProvider.of<SignInBloc>(context).add(
                        SignInSubmit(
                          params: SignInParams(
                              username: _emailController.text,
                              password: _passwordController.text),
                        ),
                      );
                    }
                  },
                  child: const Text('Sign In'),
                ),
              ],
            );
          } else if (state.status == SignInStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.status == SignInStatus.success) {
            return Container();
          }

          return const Center(
            child: Text('Something went wrong'),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final dataSource = RemoteDataSource(client: http.Client());
    final repository = AuthRepositoryImpl(dataSource: dataSource);
    final useCase = SignInUseCase(repository: repository);
    return BlocProvider(
      create: (context) => SignInBloc(signInUseCase: useCase),
      child: Scaffold(
        body: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: _buildSignInForm(),
          ),
        ),
      ),
    );
  }
}
