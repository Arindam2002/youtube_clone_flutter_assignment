import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_shorts_clone/providers/apiProvider.dart';
import 'package:youtube_shorts_clone/shorts_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData windowData =
    MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    windowData = windowData.copyWith(
      textScaleFactor: 1,
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Api()),
      ],
      child: MediaQuery(
        data: windowData,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const ShortsScreen(),
        ),
      ),
    );
  }
}
