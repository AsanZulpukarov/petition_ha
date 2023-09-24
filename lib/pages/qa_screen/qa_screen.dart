import 'package:flutter/material.dart';
import 'package:petition_ha/pages/lenta_screen/fetch/fetch_lenta_screen.dart';
import 'package:petition_ha/pages/qa_screen/qa_section_screen.dart';
import 'package:petition_ha/shared/app_colors.dart';

import '../../widgets/date_format.dart';
import '../../widgets/kodeks_item.dart';
import 'fetch/fetch_qa_screen.dart';

class QAScreen extends StatelessWidget {
  const QAScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchCategory(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.data!.isEmpty) {
              return Center(
                child: Text("Нет данных в базе"),
              );
            }
            return ListView.builder(
              padding: EdgeInsets.all(20),
              itemCount: snapshot.data!.data!.length,
              itemBuilder: (context, index) {
                final item = snapshot.data?.data?.elementAt(index);
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QASectionScreen(id: item!.id!),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.blue),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${item?.name}'),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text('Дата обновления'),
                            SizedBox(
                              width: 10,
                            ),
                            Text(dateFormat(item!.lastUpdate!)),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Center(
              child: Text("Ошибка"),
            );
          }
        });
  }
}
