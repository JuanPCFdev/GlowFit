import 'package:flutter/material.dart';

class CustomDatePicker extends StatelessWidget {
  final DateTime? selectedDate;
  final Function(DateTime) onDateSelected;
  final String labelText;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final Color primaryColor;
  final Color textColor;

  const CustomDatePicker({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
    this.labelText = 'Fecha',
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.primaryColor = Colors.black,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: Icon(Icons.calendar_today, color: primaryColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: primaryColor, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: primaryColor, width: 1.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: primaryColor, width: 1.0),
        ),
        labelStyle: TextStyle(color: textColor.withOpacity(0.7)),
      ),
      controller: TextEditingController(
        text:
            selectedDate == null
                ? ''
                : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
      ),
      onTap: () async {
        final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: initialDate ?? selectedDate ?? DateTime.now(),
          firstDate: firstDate ?? DateTime(1900),
          lastDate: lastDate ?? DateTime.now(),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: primaryColor,
                  onPrimary: Colors.white,
                  onSurface: textColor,
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(foregroundColor: textColor),
                ),
              ),
              child: child!,
            );
          },
        );

        if (picked != null && picked != selectedDate) {
          onDateSelected(picked);
        }
      },
    );
  }
}
