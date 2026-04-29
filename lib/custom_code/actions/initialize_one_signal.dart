// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
// DO NOT REMOVE THE CODE ABOVE!

// OneSignal Initialization (Android + iOS)

import 'package:onesignal_flutter/onesignal_flutter.dart';

Future<void> initializeOneSignal() async {
  const String oneSignalAppId = "82e2ce35-cf98-443f-8d5d-57a5872a5cbf";

  // Optional: Debug logs (remove in production)
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

  // Initialize OneSignal
  OneSignal.initialize(oneSignalAppId);

  // Request notification permission (iOS required, Android safe)
  await OneSignal.Notifications.requestPermission(true);

  // Optional: Get and print User ID (Player ID)
  final userId = OneSignal.User.pushSubscription.id;
  print("OneSignal Player ID: $userId");

  // Optional: Check subscription status
  final isSubscribed = OneSignal.User.pushSubscription.optedIn;
  print("Is Subscribed: $isSubscribed");

  print("OneSignal initialized successfully!");
}
