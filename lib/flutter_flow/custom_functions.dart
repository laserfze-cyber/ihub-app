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
import '/backend/supabase/supabase.dart';
import '/auth/firebase_auth/auth_util.dart';

String monthplus31days(String? plusonemonth) {
  // add to global current time and date one month
  DateTime now = DateTime.now();
  DateTime oneMonthLater = DateTime(now.year, now.month + 1, now.day);
  return DateFormat('yyyy-MM-dd HH:mm:ss').format(oneMonthLater);
}

String? advtimeremain(String? timeremain) {
  // result equal current date minus created date
  DateTime now = DateTime.now();
  DateTime createdDate = DateTime.parse(timeremain!);
  Duration difference = now.difference(createdDate);
  return difference.inDays.toString() +
      ' days, ' +
      (difference.inHours % 24).toString() +
      ' hours, ' +
      (difference.inMinutes % 60).toString() +
      ' minutes';
}

String? latLngToString(LatLng? latlngpoint) {
  if (latlngpoint == null) {
    return '';
  }

  return '${latlngpoint.latitude},${latlngpoint.longitude}';
}

List<dynamic>? findNearestDrivers(
  LatLng customerLocation,
  List<LatLng>? driverLocations,
  List<String>? driverEmails,
  List<String>? driverIds,
  List<String>? driverPhones,
) {
  if (driverLocations == null ||
      driverEmails == null ||
      driverIds == null ||
      driverPhones == null) {
    return [];
  }

  List<Map<String, dynamic>> distances = [];

  for (int i = 0; i < driverLocations.length; i++) {
    final driver = driverLocations[i];

    final dLat = (driver.latitude - customerLocation.latitude) * math.pi / 180;
    final dLng =
        (driver.longitude - customerLocation.longitude) * math.pi / 180;

    final a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(customerLocation.latitude * math.pi / 180) *
            math.cos(driver.latitude * math.pi / 180) *
            math.sin(dLng / 2) *
            math.sin(dLng / 2);

    final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    final distance = 6371 * c;

    distances.add({
      "email": driverEmails[i],
      "id": driverIds[i],
      "phone": driverPhones[i], // ✅ Added phone here
      "location": driver,
      "distance": distance,
    });
  }

  distances.sort((a, b) => a["distance"].compareTo(b["distance"]));

  return distances.take(5).toList();
}

bool? time45second(
  DateTime? currentTime,
  DateTime? orderTime,
) {
  bool has45SecondsPassed(
    DateTime currentTime,
    DateTime orderTime,
  ) {
    return currentTime.difference(orderTime).inSeconds > 45;
  }
}

DateTime? findfinishtime(int? secondsToAdd) {
  if (secondsToAdd == null) return null;

  // Get current time
  final now = DateTime.now();

  // Add the seconds from your collection variable
  return now.add(Duration(seconds: secondsToAdd));
}

List<String> getCountryList() {
  return [
    'Afghanistan',
    'Albania',
    'Algeria',
    'Andorra',
    'Angola',
    'Antigua and Barbuda',
    'Argentina',
    'Armenia',
    'Australia',
    'Austria',
    'Azerbaijan',
    'Bahamas',
    'Bahrain',
    'Bangladesh',
    'Barbados',
    'Belarus',
    'Belgium',
    'Belize',
    'Benin',
    'Bhutan',
    'Bolivia',
    'Bosnia and Herzegovina',
    'Botswana',
    'Brazil',
    'Brunei',
    'Bulgaria',
    'Burkina Faso',
    'Burundi',
    'Cabo Verde',
    'Cambodia',
    'Cameroon',
    'Canada',
    'Central African Republic',
    'Chad',
    'Chile',
    'China',
    'Colombia',
    'Comoros',
    'Congo, Democratic Republic of the',
    'Congo, Republic of the',
    'Costa Rica',
    'Croatia',
    'Cuba',
    'Cyprus',
    'Czech Republic',
    'Denmark',
    'Djibouti',
    'Dominica',
    'Dominican Republic',
    'Ecuador',
    'Egypt',
    'El Salvador',
    'Equatorial Guinea',
    'Eritrea',
    'Estonia',
    'Eswatini',
    'Ethiopia',
    'Fiji',
    'Finland',
    'France',
    'Gabon',
    'Gambia',
    'Georgia',
    'Germany',
    'Ghana',
    'Greece',
    'Grenada',
    'Guatemala',
    'Guinea',
    'Guinea-Bissau',
    'Guyana',
    'Haiti',
    'Honduras',
    'Hungary',
    'Iceland',
    'India',
    'Indonesia',
    'Iran',
    'Iraq',
    'Ireland',
    'Israel',
    'Italy',
    'Jamaica',
    'Japan',
    'Jordan',
    'Kazakhstan',
    'Kenya',
    'Kiribati',
    'Korea, North',
    'Korea, South',
    'Kuwait',
    'Kyrgyzstan',
    'Laos',
    'Latvia',
    'Lebanon',
    'Lesotho',
    'Liberia',
    'Libya',
    'Liechtenstein',
    'Lithuania',
    'Luxembourg',
    'Madagascar',
    'Malawi',
    'Malaysia',
    'Maldives',
    'Mali',
    'Malta',
    'Marshall Islands',
    'Mauritania',
    'Mauritius',
    'Mexico',
    'Micronesia',
    'Moldova',
    'Monaco',
    'Mongolia',
    'Montenegro',
    'Morocco',
    'Mozambique',
    'Myanmar',
    'Namibia',
    'Nauru',
    'Nepal',
    'Netherlands',
    'New Zealand',
    'Nicaragua',
    'Niger',
    'Nigeria',
    'North Macedonia',
    'Norway',
    'Oman',
    'Pakistan',
    'Palau',
    'Palestine',
    'Panama',
    'Papua New Guinea',
    'Paraguay',
    'Peru',
    'Philippines',
    'Poland',
    'Portugal',
    'Qatar',
    'Romania',
    'Russia',
    'Rwanda',
    'Saint Kitts and Nevis',
    'Saint Lucia',
    'Saint Vincent and the Grenadines',
    'Samoa',
    'San Marino',
    'Sao Tome and Principe',
    'Saudi Arabia',
    'Senegal',
    'Serbia',
    'Seychelles',
    'Sierra Leone',
    'Singapore',
    'Slovakia',
    'Slovenia',
    'Solomon Islands',
    'Somalia',
    'South Africa',
    'South Sudan',
    'Spain',
    'Sri Lanka',
    'Sudan',
    'Suriname',
    'Sweden',
    'Switzerland',
    'Syria',
    'Taiwan',
    'Tajikistan',
    'Tanzania',
    'Thailand',
    'Timor-Leste',
    'Togo',
    'Tonga',
    'Trinidad and Tobago',
    'Tunisia',
    'Turkey',
    'Turkmenistan',
    'Tuvalu',
    'Uganda',
    'Ukraine',
    'United Arab Emirates',
    'United Kingdom',
    'United States',
    'Uruguay',
    'Uzbekistan',
  ];
}
