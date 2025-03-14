import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

DateTime getDayStart(DateTime currentTime) {
  return DateTime(currentTime.year, currentTime.month, currentTime.day);
}

DateTime getDayEnd(DateTime currentTime) {
  return DateTime(
      currentTime.year, currentTime.month, currentTime.day, 23, 59, 59);
}

DateTime decrementDate(DateTime currentDate) {
  return currentDate.subtract(Duration(days: 1));
}

DateTime incrementDate(DateTime currentDate) {
  return currentDate.add(Duration(days: 1));
}

int daysSince(DateTime date) {
  return DateTime.now().difference(date).inDays;
}
