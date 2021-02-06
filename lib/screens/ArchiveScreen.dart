import 'package:flutter/material.dart';
import 'package:japp_app/Models/Card.dart';
import 'package:japp_app/Models/DBP.dart';

class ArchiveScreen extends StatefulWidget {
  static const String id = 'archive_screen';
  @override
  _ArchiveScreenState createState() => _ArchiveScreenState();
}

class _ArchiveScreenState extends State<ArchiveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Архив'),
        ),
        body: FutureBuilder<List<QCard>>(
          future: DBProvider.db.getCards(),
          builder: (BuildContext context, AsyncSnapshot<List<QCard>> snapshot) {
            if (snapshot.hasData) {
              print("we have data!");
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    QCard item = snapshot.data[index];
                    return ListTile(
                      title: Text(item.dateTime.day.toString()),
                      leading: Text(item.progress.toString()),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}

class ArchiveScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {}
}
