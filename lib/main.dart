import 'package:flutter/material.dart';
import 'note_list.dart';
import 'note.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'database/database_helper.dart';
Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.lightBlue,
  ));
  runApp(MyApp());

}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Note',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
      ),
      defaultTransition: Transition.rightToLeft,
      home: NoteList(),
    );
  }
}
// MaterialApp(
// debugShowCheckedModeBanner: false,
// // home: NoteList(),
// initialRoute: NoteList.id,
// routes: {
// NoteList.id:(context) => NoteList(),
// Note.id:(context) => Note(),
// },
// );