import 'package:flutter/material.dart';
import 'package:notepad/provider/theme_provider.dart';
import 'package:provider/provider.dart';
import 'note.dart';
import 'package:get/get.dart';
import 'database/note_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'provider/change_theme_button_widget.dart';

bool check = false;

class NoteList extends StatelessWidget {
  final _noteController = Get.put(NoteController());
  static const String id = 'NoteList';

  @override
  Widget build(BuildContext context) {
    final text = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () async {
          await Get.to(Note());
          _noteController.getNotes();
        },
        child: Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        actions: [
          ChangeThemeButtonWidget(),
        ],
        title: Text(
          'Notes',
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: Obx(() {
          return ListView.builder(
            itemCount: _noteController.noteModelList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => Card(
              shadowColor: Colors.white,
              color: Theme.of(context).primaryColor,
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          _noteController.noteModelList[index].title,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        IconButton(
                            color: Colors.black54,
                            icon: Icon(
                              Icons.delete_forever,
                              color: Colors.red,
                            ),
                            onPressed: () async {
                              final ConfirmAction action = await _asyncConfirmDialog(context);
                              if (check != false) {
                                _noteController.deleteNote(
                                    _noteController.noteModelList[index]);
                              }
                            }),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      _noteController.noteModelList[index].note,
                      style: GoogleFonts.aBeeZee(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

enum ConfirmAction { Cancel, Accept}
Future<ConfirmAction> _asyncConfirmDialog(BuildContext context) async {
  return showDialog<ConfirmAction>(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Warning'),
        content: const Text(
            'This will delete the contact from your Note List.'),
        actions: <Widget>[
          FlatButton(
            child: const Text('Cancel'),
            onPressed: () {
              check = false;
              Navigator.of(context).pop(ConfirmAction.Cancel);
            },
          ),
          FlatButton(
            child: const Text('Delete'),
            onPressed: () {
              check = true;
              Navigator.of(context).pop(ConfirmAction.Accept);
            },
          )
        ],
      );
    },
  );
}
