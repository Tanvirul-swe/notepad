import 'package:flutter/material.dart';
import 'note.dart';
import 'package:get/get.dart';
import 'database/note_controller.dart';
import 'package:google_fonts/google_fonts.dart';


class NoteList extends StatelessWidget {
  final _noteController = Get.put(NoteController());
  static const String id ='NoteList';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Get.to(Note());
          _noteController.getNotes();
        },
        child: Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
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
             shadowColor: Colors.grey,
              color: Colors.white70,
              elevation: 10,
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
                          icon: Icon(Icons.clear),
                          onPressed: () => _noteController
                              .deleteNote(_noteController.noteModelList[index]),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      _noteController.noteModelList[index].note,
                      style: GoogleFonts.aBeeZee(
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

