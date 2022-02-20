import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';

class ChangeThemeButtonWidget extends StatefulWidget {
  @override
  State<ChangeThemeButtonWidget> createState() => _ChangeThemeButtonWidgetState();
}

class _ChangeThemeButtonWidgetState extends State<ChangeThemeButtonWidget> {
int even = 10;
bool value = false;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return IconButton(onPressed: (){
          even++;
       if(even % 2==0){
         setState(() {
           value = true;
           themeProvider.isDarkMode;
           final provider = Provider.of<ThemeProvider>(context, listen: false);
           provider.toggleTheme(value);
         });
       }
       else{
         setState(() {
           value = false;
           themeProvider.isDarkMode;
           final provider = Provider.of<ThemeProvider>(context, listen: false);
           provider.toggleTheme(value);
         });
       }


    }, icon: value==true?Image.asset('Assets/black.png',color: Colors.white):Image.asset('Assets/white.png',));

  }
}
