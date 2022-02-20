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

    },
  );
}


