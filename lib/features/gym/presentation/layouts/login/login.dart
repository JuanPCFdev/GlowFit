import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:glow_fit_app/features/gym/presentation/widgets/custom_button.dart';
import 'package:glow_fit_app/features/gym/presentation/widgets/custom_text_field.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Cerrar el teclado cuando se toque fuera de los campos de texto
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 80),
          child: ListView(
            children: [
              Image.asset('assets/images/heroimg.png', width: 400, height: 300),
              const SizedBox(height: 25),
              CustomTextField(labelText: 'Correo'),
              const SizedBox(height: 25),
              CustomTextField(labelText: 'Contraseña', obscureText: true),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "¿Olvidaste tu contraseña?",
                    style: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                      decorationColor: const Color.fromARGB(255, 0, 0, 0),
                      decorationThickness: 1.0,
                      textBaseline: TextBaseline.alphabetic,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              CustomButton(
                text: 'Ingresar',
                onPressed: () {},
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w600,
                borderRadius: 8,
                height: 60,
                width: double.infinity,
                padding: EdgeInsets.zero,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "¿No tienes una cuenta? ",
                    style: GoogleFonts.poppins(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 10),
                  TextButton(
                    onPressed: () => context.go('/register'),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      "Regístrate",
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
