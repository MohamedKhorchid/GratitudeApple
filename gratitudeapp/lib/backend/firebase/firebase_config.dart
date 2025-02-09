import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB-XNx2qgbD5T92cHWoa4EQQ8kmr7kcqPU",
            authDomain: "gratitudeapp-3d5e6.firebaseapp.com",
            projectId: "gratitudeapp-3d5e6",
            storageBucket: "gratitudeapp-3d5e6.firebasestorage.app",
            messagingSenderId: "521866091888",
            appId: "1:521866091888:web:d40d8c29ac20e7ee7403b5",
            measurementId: "G-3VTRRGP2EB"));
  } else {
    await Firebase.initializeApp();
  }
}
