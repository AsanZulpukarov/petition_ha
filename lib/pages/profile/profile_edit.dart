import 'package:flutter/material.dart';

import '../../shared/app_colors.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.mainColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.mainColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.mainColor),
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Изменить профиль'),
          backgroundColor: AppColors.white,
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Если хотите поменять email заполните!"),
              SizedBox(height: 5),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              SizedBox(height: 20),
              Text("Если хотите поменять имя заполните!"),
              SizedBox(height: 5),
              TextField(
                controller: _firstNameController,
                decoration: InputDecoration(labelText: 'Имя'),
              ),
              SizedBox(height: 20),
              Text("Если хотите поменять фамилия заполните!"),
              SizedBox(height: 5),
              TextField(
                controller: _lastNameController,
                decoration: InputDecoration(labelText: 'Фамилия'),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    String email = _emailController.text;
                    String firstName = _firstNameController.text;
                    String lastName = _lastNameController.text;

                    print('Email: $email');
                    print('Имя: $firstName');
                    print('Фамилия: $lastName');
                  },
                  child: Text('Сохранить изменения'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }
}
