import 'package:flutter/material.dart';
import 'package:glow_fit_app/features/gym/presentation/layouts/home.dart';
import 'package:go_router/go_router.dart';
import 'package:glow_fit_app/features/gym/presentation/layouts/login/login.dart';
import 'package:glow_fit_app/features/gym/presentation/layouts/register/register.dart';
import 'package:glow_fit_app/features/gym/presentation/layouts/forms/first_time_form.dart';

// Definición de las rutas de la aplicación
class AppRouter {
  // Instancia de GoRouter
  static final router = GoRouter(
    initialLocation: '/home',
    routes: [
      // Ruta para la pantalla de inicio de sesión
      GoRoute(
        path: '/login',
        name: 'login',
        pageBuilder:
            (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const Login(),
              transitionsBuilder: (
                context,
                animation,
                secondaryAnimation,
                child,
              ) {
                // Sin transición
                return child;
              },
              transitionDuration: Duration.zero,
            ),
      ),
      // Ruta para la pantalla de registro
      GoRoute(
        path: '/register',
        name: 'register',
        pageBuilder:
            (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const Register(),
              transitionsBuilder: (
                context,
                animation,
                secondaryAnimation,
                child,
              ) {
                // Sin transición
                return child;
              },
              transitionDuration: Duration.zero,
            ),
      ),
      GoRoute(
        path: '/first_time_form',
        name: 'first_time_form',
        pageBuilder:
            (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const FirstTimeForm(),
              transitionsBuilder: (
                context,
                animation,
                secondaryAnimation,
                child,
              ) {
                // Sin transición
                return child;
              },
              transitionDuration: Duration.zero,
            ),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        pageBuilder:
            (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const Home(),
              transitionsBuilder: (
                context,
                animation,
                secondaryAnimation,
                child,
              ) {
                // Sin transición
                return child;
              },
              transitionDuration: Duration.zero,
            ),
      ),
      // Puedes agregar más rutas aquí según sea necesario
    ],
    // Manejo de errores
    errorPageBuilder:
        (context, state) => MaterialPage(
          key: state.pageKey,
          child: Scaffold(body: Center(child: Text('Error: ${state.error}'))),
        ),
  );

  // Métodos estáticos para navegación
  static void goToLogin(BuildContext context) {
    context.goNamed('login');
  }

  static void goToRegister(BuildContext context) {
    context.goNamed('register');
  }

  static void goToFirstTimeForm(BuildContext context) {
    context.goNamed('first_time_form');
  }
}
