import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:promodoro_app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.top]);
  runApp(const MyApp());
}
