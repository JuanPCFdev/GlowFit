import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:glow_fit_app/features/gym/presentation/widgets/custom_text_field.dart';
import 'package:glow_fit_app/features/gym/presentation/widgets/custom_select_field.dart';
import 'package:glow_fit_app/features/gym/presentation/widgets/custom_button.dart';
import 'package:glow_fit_app/features/gym/presentation/widgets/custom_date_picker.dart';

class FirstTimeForm extends StatefulWidget {
  const FirstTimeForm({super.key});

  @override
  State<FirstTimeForm> createState() => _FirstTimeFormState();
}

class _FirstTimeFormState extends State<FirstTimeForm> {
  DateTime? _selectedDate;
  final String testName = 'Daniel Antonio';
  String? _selectedGender;

  void _onGenderChanged(String? newValue) {
    setState(() {
      _selectedGender = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              // Título en la parte superior
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hola, $testName!',
                      style: GoogleFonts.poppins(
                        fontSize: 50,
                        fontWeight: FontWeight.w600,
                        height: 1.2,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Queremos saber más de ti.',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        height: 1.2,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              // Formulario centrado
              Expanded(
                child: Center(
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 500),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextField(labelText: 'Peso en kg'),
                          const SizedBox(height: 25),
                          CustomTextField(labelText: 'Altura en cm'),
                          const SizedBox(height: 25),
                          CustomDatePicker(
                            selectedDate: _selectedDate,
                            onDateSelected: (date) {
                              setState(() => _selectedDate = date);
                            },
                            labelText: 'Fecha de nacimiento',
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          ),
                          const SizedBox(height: 25),
                          CustomSelectField(
                            value: _selectedGender,
                            onChanged: _onGenderChanged,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Botón en la parte inferior
              Padding(
                padding: const EdgeInsets.only(bottom: 80),
                child: CustomButton(
                  text: 'Continuar',
                  onPressed: () {},
                  backgroundColor: Colors.transparent,
                  textColor: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  borderRadius: 8,
                  height: 60,
                  width: double.infinity,
                  padding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
