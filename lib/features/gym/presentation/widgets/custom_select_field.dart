import 'package:flutter/material.dart';

class CustomSelectField extends StatelessWidget {
  final String? value;
  final Function(String?) onChanged;
  static const List<String> items = ['Masculino', 'Femenino'];

  const CustomSelectField({super.key, this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        popupMenuTheme: PopupMenuThemeData(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.black, width: 1),
          ),
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black, width: 1),
            ),
            child: PopupMenuButton<String>(
              constraints: BoxConstraints(
                minWidth: constraints.maxWidth,
                maxWidth: constraints.maxWidth,
              ),
              onSelected: onChanged,
              itemBuilder:
                  (context) =>
                      items
                          .map(
                            (choice) => PopupMenuItem<String>(
                              value: choice,
                              child: SizedBox(
                                width:
                                    constraints.maxWidth -
                                    48, // Ajuste para padding interno
                                child: Text(choice),
                              ),
                            ),
                          )
                          .toList(),
              offset: const Offset(0, 56),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      value ?? 'Genero',
                      style: TextStyle(
                        color: value == null ? Colors.grey[600] : Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
