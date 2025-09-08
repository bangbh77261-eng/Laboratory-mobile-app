import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  // Header (dùng cho AppBar / màn hình chính)
  static TextStyle header(BuildContext context) {
    return GoogleFonts.roboto(
      textStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
    );
  }

  // Title (dùng cho card, section)
  static TextStyle title(BuildContext context) {
    return GoogleFonts.montserrat(
      textStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
    );
  }

  // Body (nội dung chính)
  static TextStyle body(BuildContext context) {
    return GoogleFonts.openSans(
      textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.normal,
            color: Colors.black54,
          ),
    );
  }

  // Caption (chú thích nhỏ)
  static TextStyle caption(BuildContext context) {
    return GoogleFonts.lato(
      textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontStyle: FontStyle.italic,
            color: Colors.grey[600],
          ),
    );
  }
}
