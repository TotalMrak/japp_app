import 'package:flutter/material.dart';
import 'package:japp_app/Widgets/ArchiveCard.dart';
import 'package:provider/provider.dart';
import 'package:japp_app/Models/ArchiveData.dart';

class ArchiveScreen extends StatelessWidget {
  static const String id = 'archive_screen';

  @override
  Widget build(BuildContext context) {
    return Consumer<ArchiveData>(
      builder: (context, archiveData, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Архив'),
            actions: [
              Visibility(
                visible: archiveData.showDel,
                child: IconButton(
                  icon: const Icon(Icons.delete_forever_sharp),
                  tooltip: 'Удалить выбранное',
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Подтвердите удаление"),
                            actions: [
                              TextButton(
                                child: Text('Да'),
                                onPressed: () {
                                  archiveData.deleteChecked();
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: Text('Нет'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        });
                  },
                ),
              ),
            ],
          ),
          body: ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              padding: const EdgeInsets.all(12),
              itemCount: archiveData.abc.length,
              itemBuilder: (context, index) {
                final card = archiveData.abc[index];
                return ArchiveCard(
                  card: card,
                  checkBoxCallback: (checkBoxState) {
                    archiveData.updateCard(card);
                  },
                );
              }),
        );
      },
    );
  }
}

/*class ArchiveScreen extends StatefulWidget {
  static const String id = 'archive_screen';
  @override
  _ArchiveScreenState createState() => _ArchiveScreenState();
}

class _ArchiveScreenState extends State<ArchiveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(children: [Text('Архив')]),
        ),
        body: FutureBuilder<List<QCard>>(
          future: DBProvider.db.getCards(),
          builder: (BuildContext context, AsyncSnapshot<List<QCard>> snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                  padding: const EdgeInsets.all(12),
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    QCard item = snapshot.data[index];
                    return ArchiveCard(card: item);
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}*/
