import 'package:flutter/material.dart';

class ArchiveScreen extends StatelessWidget {
  static const String id = 'archive_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Архив'),
      ),
      body: ListView.builder(itemBuilder: null),
    );
  }
}
