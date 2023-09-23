import 'package:flutter/material.dart';
import 'package:petition_ha/theme.dart';
import 'package:petition_ha/widgets/scaffold_widget.dart';

import '../../../widgets/profile_item.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final BoxDecoration _boxDecoration = BoxDecoration(
    border: Border.all(
      color: AppColors.white,
    ),
    borderRadius: BorderRadius.circular(20),
  );

  @override
  Widget build(BuildContext context) {
    return MyScaffoldWidget(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              decoration: _boxDecoration.copyWith(
                color: Colors.blue,
              ),
              width: double.infinity,
              height: 100,
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.network(
                          'https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80',
                        ).image,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "FIO",
                          style: AppTextStyles.black16
                              .copyWith(color: AppColors.white),
                        ),
                        Text(
                          "Tel",
                          style: AppTextStyles.black14.copyWith(
                              fontStyle: FontStyle.italic,
                              color: AppColors.white),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                        decoration: _boxDecoration.copyWith(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: 50,
                        width: 50,
                        child: const Icon(
                          Icons.qr_code_2,
                          size: 30,
                        )),
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ProfileItem(
                        title: "Изменить профиль",
                        onTap: () {},
                        icon: const Icon(Icons.edit),
                      ),
                      ProfileItem(
                        title: "Новости",
                        onTap: () {},
                        icon: const Icon(Icons.newspaper),
                      ),
                      ProfileItem(
                        title: "Мои избранные",
                        onTap: () {},
                        icon: const Icon(Icons.favorite),
                      ),
                      ProfileItem(
                        title: "Мои петиции",
                        onTap: () {},
                        icon: const Icon(Icons.list_alt),
                      ),
                      ProfileItem(
                        title: "О приложении",
                        onTap: () {},
                        icon: const Icon(Icons.perm_device_info),
                      ),
                      ProfileItem(
                        title: "Выйти",
                        onTap: () {},
                        icon: const Icon(Icons.exit_to_app),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: Center(
                      child: Text(
                        'Ради Кыргызстана!',
                        style: AppTextStyles.custom18.copyWith(fontSize: 50),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
