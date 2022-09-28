import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const TextStyle fontTitleCenter =
    TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold);

const TextStyle fontTitle =
    TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold);
const TextStyle fontBody =
    TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.w500);

TextStyle fontHint = TextStyle(
    fontSize: 8,
    color: Colors.black.withOpacity(0.7),
    fontWeight: FontWeight.w500);

TextStyle fontButtonBlack = GoogleFonts.raleway(
    fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black);

TextStyle fontButtonWhite = GoogleFonts.bitter(
    fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white);

TextStyle fontTextButton = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: const Color.fromRGBO(26, 148, 255, 1));

TextStyle fontTextButtonRed = GoogleFonts.inter(
    fontSize: 14, fontWeight: FontWeight.w400, height: 1.5, color: Colors.red);
