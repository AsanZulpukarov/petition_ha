import 'package:flutter/material.dart';
import 'package:petition_ha/pages/qa_screen/qa_chapter_screen.dart';
import 'package:petition_ha/shared/app_colors.dart';
import '../../widgets/appBar.dart';
import '../../widgets/scaffold_widget.dart';
import 'fetch/fetch_qa_screen.dart';
import 'fetch/fetch_section_screen.dart';

class QASectionScreen extends StatelessWidget {
  const QASectionScreen({Key? key, required this.id}) : super(key: key);

  final int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text("Разделы"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.black,
          ),
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: BackgroundView(
              size: 150,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const Align(
            alignment: Alignment.bottomRight,
            child: BackgroundView(),
          ),
          Center(
            child: FutureBuilder(
                future: fetchSection(id),
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
                                builder: (context) =>
                                    QAChaperScreen(id: item!.id!),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: AppColors.blue),
                            ),
                            child: Column(
                              children: [
                                Text('${item?.name}'),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Center(
                      child: Text("Ошибка"),
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
