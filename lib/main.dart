// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_gogonime/Model/detail_anime.dart';
import 'package:flutter_gogonime/Screen/home.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDirectory.path);
  Hive.registerAdapter(AnimeAdapter());
  Hive.registerAdapter(EpisodesListAdapter());
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.robotoTextTheme(), appBarTheme: AppBarTheme(backgroundColor: Colors.transparent)),
      title: 'Gonime',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
