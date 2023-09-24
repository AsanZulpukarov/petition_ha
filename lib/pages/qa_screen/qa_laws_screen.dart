import 'package:flutter/material.dart';
import 'package:petition_ha/shared/app_colors.dart';
import '../../widgets/scaffold_widget.dart';
import 'fetch/fetch_laws_screen.dart';

class QALawsScreen extends StatelessWidget {
  const QALawsScreen({Key? key, required this.id}) : super(key: key);

  final int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text("Статьи"),
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
                future: fetchLaws(id),
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
                        return Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: AppColors.blue),
                          ),
                          child: Column(
                            children: [
                              Text('${item?.title}'),
                              Text('${item?.law}'),
                            ],
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
