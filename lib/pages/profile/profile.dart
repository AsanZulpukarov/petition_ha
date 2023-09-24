import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:petition_ha/fetches/local_service_user.dart';
import 'package:petition_ha/pages/profile/profile_edit.dart';
import 'package:petition_ha/shared/app_colors.dart';
import 'package:petition_ha/shared/app_text_styles.dart';
import 'package:petition_ha/verification/face_verification.dart';

import '../../verification/camera_page.dart';
import '../../verification/utils.dart';
import '../../view/auth/sing_in/sing_in_screen.dart';
import '../../widgets/prifle_item.dart';
import '../profileUsers/aboutReferal.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.blue.withAlpha(200),
            ),
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Пользователь",
                      style: AppTextStyles.black14
                          .copyWith(color: AppColors.white),
                    ),
                    Text(
                      "email",
                      style: AppTextStyles.black14
                          .copyWith(color: AppColors.white),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Амантур Маматазимов",
                      style: AppTextStyles.black16
                          .copyWith(color: AppColors.white),
                    ),
                    Text(
                      "user@a.kg",
                      style: AppTextStyles.black16
                          .copyWith(color: AppColors.white),
                    ),
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileEdit(),
                    ),
                  );
                },
              ),
              SizedBox(height: 10),
              ProfileItem(
                icon: Icon(
                  Icons.auto_graph,
                  color: AppColors.blue,
                ),
                label: 'Пройти верификацию',
                onTap: () {
                  if (!kIsWeb && Platform.isLinux) {
                    showAlert(context, "Warning",
                        "${Platform.operatingSystem} is not supported");
                    return;
                  }

                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const CameraPage();
                  }));
                  // Navigator.push(context, MaterialPageRoute(builder: ()));
                },
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutReferal(),
                    ),
                  );
                },
              ),
              SizedBox(height: 30),
              ProfileItem(
                icon: Icon(
                  Icons.exit_to_app,
                  color: AppColors.blue,
                ),
                label: 'Выйти',
                onTap: () {
                  fetchClearUserEmail();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => SingInScreen()),
                      (route) => false);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
