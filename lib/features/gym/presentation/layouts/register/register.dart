import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:glow_fit_app/features/gym/presentation/widgets/custom_button.dart';
import 'package:glow_fit_app/features/gym/presentation/widgets/custom_text_field.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Cerrar el teclado cuando se toque fuera de los campos de texto
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Registrarse',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 40),
                  CustomTextField(labelText: 'Nombre'),
                  SizedBox(height: 25),
                  CustomTextField(labelText: 'Correo'),
                  SizedBox(height: 25),
                  CustomTextField(labelText: 'Contraseña', obscureText: true),
                  const SizedBox(height: 60),
                  CustomButton(
                    text: 'Registrarse',
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
                        "¿Ya tienes una cuenta? ",
                        style: GoogleFonts.poppins(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 10),
                      TextButton(
                        onPressed: () {
                          context.go('/login');
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          "inicia sesión",
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
        ),
      ),
    );
  }
}
