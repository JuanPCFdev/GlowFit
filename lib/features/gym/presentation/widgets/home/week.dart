import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List<String> days = ['LUN', 'MAR', 'MIER', 'JUE', 'VIE', 'SAB', 'DOM'];

Widget week() {
  final today = DateTime.now().weekday - 1;
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 40),
    child: Container(
      color: Colors.transparent,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (int i = 0; i < days.length; i++)
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: i == today ? Colors.black : Colors.transparent,
                    ),
                    child: Text(
                      days[i],
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color:
                            i == today ? Colors.white : const Color(0xFF99B5BF),
                      ),
                    ),
                  ),
                  Container(
                    width: 6,
                    height: 6,
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: i == today ? Colors.black : Colors.transparent,
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
