import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:glow_fit_app/features/gym/presentation/cubits/auth/auth_cubit.dart';
import 'package:glow_fit_app/features/gym/presentation/layouts/home/home.dart';
import 'package:glow_fit_app/features/gym/presentation/layouts/login/login.dart';
import 'package:glow_fit_app/features/gym/presentation/layouts/register/register.dart';
import 'package:glow_fit_app/features/gym/presentation/layouts/splash/splash.dart';
import 'package:glow_fit_app/features/gym/presentation/layouts/forms/first_time_form.dart';

final goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const Splash()),
    GoRoute(
      path: '/login',
      builder:
          (context, state) => BlocProvider.value(
            value: GetIt.I<AuthCubit>(),
            child: const Login(),
          ),
    ),
    GoRoute(
      path: '/register',
      builder:
          (context, state) => BlocProvider.value(
            value: GetIt.I<AuthCubit>(),
            child: const Register(),
          ),
    ),
    GoRoute(
      path: '/home',
      builder:
          (context, state) => BlocProvider.value(
            value: GetIt.I<AuthCubit>(),
            child: const Home(),
          ),
    ),
    GoRoute(
      path: '/first-time-form',
      builder:
          (context, state) => BlocProvider.value(
            value: GetIt.I<AuthCubit>(),
            child: const FirstTimeForm(),
          ),
    ),
  ],
);
