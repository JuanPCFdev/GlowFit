import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget progress() {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.black,
      boxShadow: [
        BoxShadow(
          offset: const Offset(0, 4),
          blurRadius: 4,
          color: Colors.black26,
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Progreso de rutina',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Text(
                '20/20 ejercicios',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 50,
            height: 50,
            child: Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: 0.75,
                  semanticsValue: '75%',
                  semanticsLabel: '75%',
                  backgroundColor: Colors.white38,
                  color: const Color(0xFF63D6BF),
                  strokeWidth: 6,
                ),
                Center(
                  child: Text(
                    '75%',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
