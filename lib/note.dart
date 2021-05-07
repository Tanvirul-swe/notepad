import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'database/note_controller.dart';
import 'dart:async';

final NoteController _noteController = Get.find<NoteController>();
final _formKey = GlobalKey<FormState>();

class Note extends StatefulWidget {
  static const String id = 'Note';

  @override
  _NoteState createState() => _NoteState();
}

class _NoteState extends State<Note> {
  int count_word = 0;
  //
  // DateTime selectedDate = DateTime.now();
  //
  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime picked = await showDatePicker(
  //       context: context,
  //       initialDate: selectedDate,
  //       firstDate: DateTime(2015, 8),
  //       lastDate: DateTime(2101));
  //   if (picked != null && picked != selectedDate)
  //     setState(() {
  //       selectedDate = picked;
  //     });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add note'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                _noteController.addNote();
                Get.back();
              },
              child: Icon(Icons.check),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                autofocus: true,
                controller: _noteController.titleTextController,
                decoration: InputDecoration(
                  hintText: 'Input title',
                  hintStyle: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 17.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('$count_word'),
                    Text(' words'),
                  ],
                ),
              ),
              // Text("${selectedDate.toLocal()}".split(' ')[0]),
              // SizedBox(
              //   height: 20.0,
              // ),
              // RaisedButton(
              //   onPressed: () => _selectDate(context),
              //   child: Text('Select date'),
              // ),
              TextField(
                controller: _noteController.noteTextController,
                decoration: InputDecoration(
                  hintText: 'Describe',
                ),
                maxLines: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
