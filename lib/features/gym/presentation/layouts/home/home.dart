import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glow_fit_app/features/gym/presentation/cubits/auth/auth_cubit.dart';
import 'package:glow_fit_app/features/gym/presentation/cubits/auth/auth_state.dart';
import 'package:go_router/go_router.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    print('Home: Inicializando');
    context.read<AuthCubit>().initialize();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listenWhen:
          (previous, current) =>
              current is AuthAuthenticated || current is AuthUnauthenticated,
      listener: (context, state) {
        print('Home: Estado recibido: ${state.runtimeType}');
        if (state is AuthUnauthenticated) {
          print('Home: Usuario no autenticado, redirigiendo a login');
          context.go('/login');
        }
      },
      buildWhen:
          (previous, current) =>
              current is AuthAuthenticated || current is AuthLoading,
      builder: (context, state) {
        print('Home: Construyendo con estado: ${state.runtimeType}');
        if (state is AuthAuthenticated) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('GlowFit'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.logout),
                  onPressed: () {
                    print('Home: Cerrando sesión');
                    context.read<AuthCubit>().signOut();
                    context.go('/login');
                  },
                ),
              ],
            ),
            body: Center(child: Text('Bienvenido ${state.user.email}')),
          );
        }
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
