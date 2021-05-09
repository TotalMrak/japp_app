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
