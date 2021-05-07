import 'package:flutter/material.dart';
import 'package:notepad/provider/theme_provider.dart';
import 'package:provider/provider.dart';
import 'note_list.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'database/database_helper.dart';
Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  ));
  runApp(MyApp());

}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    builder: (context, _) {
      final themeProvider = Provider.of<ThemeProvider>(context);

      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: themeProvider.themeMode,
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        home: NoteList(),
      );



      //   MaterialApp(
      //   debugShowCheckedModeBanner: false,
      //   themeMode: themeProvider.themeMode,
      //   theme: MyThemes.lightTheme,
      //   darkTheme: MyThemes.darkTheme,
      //   home: NoteList(),
      // );
    },
  );
}


// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Note',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         appBarTheme: AppBarTheme(
//           brightness: Brightness.light,
//           iconTheme: IconThemeData(
//             color: Colors.white,
//           ),
//         ),
//       ),
//       defaultTransition: Transition.rightToLeft,
//       home: NoteList(),
//     );
//   }
// }
// MaterialApp(
// debugShowCheckedModeBanner: false,
// // home: NoteList(),
// initialRoute: NoteList.id,
// routes: {
// NoteList.id:(context) => NoteList(),
// Note.id:(context) => Note(),
// },
// );