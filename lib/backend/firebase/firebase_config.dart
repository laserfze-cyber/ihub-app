import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCbnJBlXchi1L-U_OIFu9zlIWFA4Sc8qdo",
            authDomain: "car-recovery-12cddt.firebaseapp.com",
            projectId: "car-recovery-12cddt",
            storageBucket: "car-recovery-12cddt.firebasestorage.app",
            messagingSenderId: "463358761532",
            appId: "1:463358761532:web:9c410386d3c09970d7c139"));
  } else {
    await Firebase.initializeApp();
  }
}
