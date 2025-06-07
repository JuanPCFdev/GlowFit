import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

PreferredSizeWidget appBarHome() {
  return AppBar(
    actions: [
      Padding(
        padding: const EdgeInsets.only(left: 40),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Colors.black, width: 1),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image(
              width: 40,
              height: 40,
              image: AssetImage('assets/images/heroimg.png'),
              fit: BoxFit.cover,
              semanticLabel: 'Profile',
            ),
          ),
        ),
      ),
      SizedBox(width: 16),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bienvenido de nuevo',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ),
          ),
          Text(
            'Pablo Antonio!',
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
      Spacer(),
      Padding(
        padding: const EdgeInsets.only(right: 40),
        child: Icon(Icons.settings, color: Colors.black, size: 34),
      ),
    ],
  );
}
