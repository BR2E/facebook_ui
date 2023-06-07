import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
// import 'package:flutter/foundation.dart';
import 'facebook_ui/facebook.dart';

void main() => runApp(DevicePreview(
      builder: (_) => const MyApp(),
      enabled: false,
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      builder: DevicePreview.appBuilder,
      locale: DevicePreview.locale(context),
      home: const Facebook(),
      theme: ThemeData(useMaterial3: true, fontFamily: 'Ubuntu'),
    );
  }
}
