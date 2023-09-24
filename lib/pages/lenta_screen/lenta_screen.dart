import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petition_ha/pages/lenta_screen/petition_info_screen.dart';

import '../../widgets/petition_info_item.dart';
import 'fetch/fetch_lenta_screen.dart';

class LentaScreen extends StatelessWidget {
  const LentaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchLentaScreen(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if(snapshot.data!.data!.isEmpty){
              return const Center(child: Text("Петициий нет"),);
            }
            return ListView.separated(
              padding: const EdgeInsets.all(20),
              itemCount: snapshot.data!.data!.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: 20),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InfoPetitionScreen(
                                  petition:
                                      snapshot.data!.data!.elementAt(index),
                                )));
                  },
                  child: PetitionInfoItem(
                      petition: snapshot.data!.data!.elementAt(index)),
                );
              },
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Center(
              child: Text("Вышла ошибка"),
            );
          }
        });
  }
}
