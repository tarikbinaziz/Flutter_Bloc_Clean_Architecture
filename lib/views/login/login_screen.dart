import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean/bloc/login_bloc.dart';
import 'package:flutter_bloc_clean/main.dart';
import 'package:flutter_bloc_clean/repository/auth/login_repo.dart';
import 'package:flutter_bloc_clean/utils/enum.dart';
import 'package:get_it/get_it.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  late LoginBloc _loginBloc;
  @override
  initState() {
    super.initState();
    _loginBloc = LoginBloc (getIt());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => _loginBloc,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (previous, current) =>
                      previous.email != current.email,
                  builder: (context, state) {
                    return TextFormField(
                      onChanged: (value) {
                        context.read<LoginBloc>().add(EmailChanged(value));
                      },
                      decoration: const InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    );
                  },
                ),
                const SizedBox(height: 16.0),
                BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (previous, current) =>
                      previous.password != current.password,
                  builder: (context, state) {
                    return TextFormField(
                      onChanged: (value) {
                        context.read<LoginBloc>().add(PasswordChanged(value));
                      },
                      decoration: const InputDecoration(labelText: 'Password'),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    );
                  },
                ),
                const SizedBox(height: 24.0),
                BlocListener<LoginBloc, LoginState>(
                  listener: (context, state) {
                    // if (state.status == PostApiStatus.loading) {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(content: Text('Loading...')),
                    //   );
                    // }
                    if (state.status == PostApiStatus.success) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(state.message)));
                    }
                    if (state.status == PostApiStatus.failure) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(state.message)));
                    }
                  },
                  child: BlocBuilder<LoginBloc, LoginState>(
                    // buildWhen: (previous, current) =>
                    //     previous.status != current.status,
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (state.password.length < 6) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Password must be at least 6 characters long',
                                  ),
                                ),
                              );
                              return;
                            }
                            context.read<LoginBloc>().add(
                              const LoginSubmitted(),
                            );
                          }
                        },
                        child: state.status == PostApiStatus.loading
                            ? const CircularProgressIndicator()
                            : const Text('Login'),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


/*
onPressed: () {
  if (_formKey.currentState!.validate()) {
    final state = context.read<LoginBloc>().state;

    if (state.password.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password must be at least 6 characters long'),
        ),
      );
      return;
    }

    context.read<LoginBloc>().add(const LoginSubmitted());
  }
}

*/