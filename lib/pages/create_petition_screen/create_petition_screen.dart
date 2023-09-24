import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petition_ha/model/create_petition_model.dart';
import 'package:petition_ha/service/api_service.dart';

import '../../shared/app_colors.dart';
import '../../shared/app_text_styles.dart';

class CreatePetitionScreen extends StatefulWidget {
  CreatePetitionScreen({Key? key}) : super(key: key);

  @override
  State<CreatePetitionScreen> createState() => _CreatePetitionScreenState();
}

class _CreatePetitionScreenState extends State<CreatePetitionScreen> {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  List<XFile> imageFile = [];

  late XFile imageFileCamera;

  final ImagePicker _picker = ImagePicker();

  Widget _subtitleText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 5.0),
      child: Text(
        text,
        style: AppTextStyles.black14,
      ),
    );
  }

  Future<void> takePhotoGalery() async {
    /*final pickedFile = await _picker.getImage(
      source: source
    );*/
    final List<XFile> images = await _picker.pickMultiImage();
    setState(() {
      imageFile.addAll(images);
    });
  }

  void takePhotoCamera() async {
    /*final pickedFile = await _picker.getImage(
      source: source
    );*/
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      imageFile.add(photo!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.mainColor),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.mainColor),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.mainColor),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      )),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 10),
            Form(
              child: Column(
                children: [
                  Text(
                    'Добрый день, уважаемый Клиент!',
                    style: AppTextStyles.black18Semibold.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                  ),
                  _subtitleText(
                    'Если вы хотите создать петицию тогда заполните эти данные',
                  ),
                  const SizedBox(height: 14),
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _subtitleText('Напишите название петиции *'),
                        TextFormField(
                          controller: _titleController,
                          decoration: const InputDecoration(
                            hintText: 'Название',
                          ),
                        ),
                        const SizedBox(height: 10),
                        _subtitleText('Напишите описание петиции*'),
                        TextFormField(
                          controller: _descriptionController,
                          decoration: const InputDecoration(
                            hintText: 'Описание',
                          ),
                          maxLines: 12,
                        ),
                        const SizedBox(height: 14),
                        Text('Загрузите фото',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400)),
                        const SizedBox(height: 7),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (imageFile.isNotEmpty)
                                Container(
                                  height: 80,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    separatorBuilder: (context, _) =>
                                        const SizedBox(width: 5),
                                    itemCount: imageFile.length,
                                    itemBuilder: (context, index) => Container(
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 1,
                                            color: AppColors.mainColor,
                                          ),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: FileImage(
                                                File(imageFile[index].path)),
                                          )),
                                    ),
                                  ),
                                ),
                              const SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: ((builder) => bottomSheet()),
                                  );
                                },
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: AppColors.mainColor,
                                    ),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Icon(Icons.add,
                                      color: AppColors.mainColor, size: 25),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                CreatePetitionModel petition =
                                    CreatePetitionModel(
                                  ruTitle: _titleController.text,
                                  kgTitle: _titleController.text,
                                  ruDescription: _descriptionController.text,
                                  kgDescription: _descriptionController.text,
                                );

                                showToast(await ApiService()
                                    .createPetition(imageFile, petition));
                              }
                            },
                            child: const Text('Отправить'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          const Text(
            "Выберите фото",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            InkWell(
              onTap: () {
                print('Camera');
                takePhotoCamera();
                print(imageFileCamera.path);
              },
              child: Ink(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.camera),
                    const SizedBox(height: 10),
                    const Text("Камера")
                  ],
                ),
              ),
            ),
            const SizedBox(width: 20),
            InkWell(
              onTap: () async {
                print('Galery');
                await takePhotoGalery();
                print(imageFile[0].path);
              },
              child: Ink(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.image),
                    const SizedBox(height: 10),
                    const Text("Гелерея")
                  ],
                ),
              ),
            ),
          ])
        ],
      ),
    );
  }

  void showToast(String msgError) => Fluttertoast.showToast(
      msg: msgError,
      fontSize: 18,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.green,
      textColor: Colors.white);
}
