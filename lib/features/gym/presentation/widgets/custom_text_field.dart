import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final bool obscureText;
  final bool showPasswordToggle;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final String? hintText;
  final Widget? prefixIcon;

  const CustomTextField({
    super.key,
    required this.labelText,
    this.obscureText = false,
    this.showPasswordToggle = false,
    this.controller,
    this.validator,
    this.onChanged,
    this.keyboardType,
    this.hintText,
    this.prefixIcon,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      onChanged: widget.onChanged,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      obscuringCharacter: '•',
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        isDense: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 1.0),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 1.0),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 1.0),
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: widget.labelText,
        hintText: widget.hintText,
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelStyle: const TextStyle(
          color: Color(0xFFD3D3D3),
          fontSize: 18,
          fontWeight: FontWeight.w300,
        ),
        prefixIcon: widget.prefixIcon,
        prefixIconConstraints: const BoxConstraints(minWidth: 40, minHeight: 0),
        suffixIcon:
            widget.obscureText || widget.showPasswordToggle
                ? Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (widget.obscureText)
                      IconButton(
                        icon: Icon(
                          _obscureText ? Icons.lock_outline : Icons.lock_open,
                          color: Colors.black,
                          size: 20,
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(
                          minWidth: 32,
                          minHeight: 32,
                        ),
                        onPressed: _togglePasswordVisibility,
                      ),
                    if (widget.showPasswordToggle)
                      IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.black,
                          size: 20,
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(
                          minWidth: 32,
                          minHeight: 32,
                        ),
                        onPressed: _togglePasswordVisibility,
                      ),
                  ],
                )
                : null,
      ),
    );
  }
}
