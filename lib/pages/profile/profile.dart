import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petition_ha/shared/app_colors.dart';

import '../../widgets/prifle_item.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.blue.withOpacity(0.6),
              ),
              padding: const EdgeInsets.all(15),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Пользователь"),
                      Text("email"),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Амантур Маматазимов"),
                      Text("user@a.kg"),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Column(
              children: [
                ProfileItem(
                  icon: Icon(
                    Icons.edit,
                    color: AppColors.blue,
                  ),
                  label: 'Изменить профиль',
                  onTap: () {},
                ),
                SizedBox(height: 10),
                ProfileItem(
                  icon: Icon(
                    Icons.auto_graph,
                    color: AppColors.blue,
                  ),
                  label: 'Статистика',
                  onTap: () {},
                ),
                SizedBox(height: 10),
                ProfileItem(
                  icon: Icon(
                    Icons.newspaper,
                    color: AppColors.blue,
                  ),
                  label: 'Новости',
                  onTap: () {},
                ),
                SizedBox(height: 10),
                ProfileItem(
                  icon: Icon(
                    Icons.info,
                    color: AppColors.blue,
                  ),
                  label: 'Мои петиции',
                  onTap: () {},
                ),
                SizedBox(height: 10),
                ProfileItem(
                  icon: Icon(
                    Icons.phone_android_rounded,
                    color: AppColors.blue,
                  ),
                  label: 'О приложении',
                  onTap: () {},
                ),
                SizedBox(height: 30),
                ProfileItem(
                  icon: Icon(
                    Icons.exit_to_app,
                    color: AppColors.blue,
                  ),
                  label: 'Выйти',
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
