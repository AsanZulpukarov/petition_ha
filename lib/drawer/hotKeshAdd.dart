import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:petition_ha/service/api_service.dart';
import 'package:provider/provider.dart';
import '../../shared/app_colors.dart';
import 'package:image_picker/image_picker.dart';
import '../category/selectCategoty.dart';
import '../pages/dashboard.dart';
import '../provider/selectCatProvider.dart';
import '../widgets/appBar.dart';
import 'utils.dart';

class HotKeshAdd extends StatefulWidget {
  const HotKeshAdd({Key? key}) : super(key: key);

  @override
  _HotKeshAddState createState() => _HotKeshAddState();
}

class _HotKeshAddState extends State<HotKeshAdd> {
  late String emailGet;

  @override
  void initState() {
    // TODO: implement initState
    emailGet = Provider.of<SelectCatProvider>(context, listen: false).email;
    print(emailGet);
    super.initState();
  }

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime selectedDate1 = DateTime.now();
  DateTime selectedDate2 = DateTime.now();

  String hintText = 'Введите описания';

  List<XFile> imageFile = [];
  late XFile imageFileCamera;
  final ImagePicker _picker = ImagePicker();

  TextEditingController price = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Выберите фото",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
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
                  color: AppColors.customButton,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Icon(Icons.camera),
                    SizedBox(height: 10),
                    Text("Камера")
                  ],
                ),
              ),
            ),
            SizedBox(width: 20),
            InkWell(
              onTap: () {
                print('Galery');
                takePhotoGalery();
                print(imageFile[0].path);
              },
              child: Ink(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.customButton,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Icon(Icons.image),
                    SizedBox(height: 10),
                    Text("Гелерея")
                  ],
                ),
              ),
            ),

            /*IconButton(onPressed: (){
              takePhoto(ImageSource.camera);
            }, icon: Icon(Icons.camera),
            ),*/

            /*Expanded(
              child: ElevatedButton.icon(

                icon: Icon(Icons.camera),
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                label: Text(''),
              ),
            ),*/
            /*IconButton(onPressed: (){takePhoto(ImageSource.gallery);}, icon: Icon(Icons.image),),*/
            /*Expanded(
              child: ElevatedButton.icon(
                icon: Icon(Icons.image),
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                label: Text(''),
              ),
            ),*/
          ])
        ],
      ),
    );
  }

  void takePhotoGalery() async {
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
    return Scaffold(
      appBar: AllAppBar(),
      body: ListView(
        children: [
          // Container(
          //   width: 142,
          //   height: 142,
          //   padding: EdgeInsets.all(9),
          //   decoration: BoxDecoration(
          //       shape: BoxShape.circle,
          //       color: Colors.white,
          //       boxShadow: [
          //         BoxShadow(
          //             blurRadius: 5,
          //             offset: Offset(0, 0),
          //             color: Color(0x26000000))
          //       ]),
          //   child: Container(
          //     padding: EdgeInsets.all(9),
          //     decoration: BoxDecoration(
          //         shape: BoxShape.circle,
          //         color: Colors.white,
          //         boxShadow: [
          //           BoxShadow(
          //               blurRadius: 5,
          //               offset: Offset(0, 0),
          //               color: Color(0x26000000))
          //         ]),
          //     child: Stack(
          //       children: [
          //         Container(
          //           padding: EdgeInsets.all(8),
          //           decoration: BoxDecoration(
          //             color: Colors.white,
          //             shape: BoxShape.circle,
          //             border: Border.all(
          //                 width: 0.5,
          //                 color: Color(0xFF929292).withOpacity(0.37)),
          //             boxShadow: [
          //               BoxShadow(
          //                   blurRadius: 16,
          //                   offset: Offset(0, 0),
          //                   color: Color(0x33000000))
          //             ],
          //             image: DecorationImage(
          //                 image: AssetImage('assets/img/hotKesh/addIcon.png')),
          //           ),
          //         ),
          //         Positioned(
          //           top: 0,
          //           right: 85,
          //           child: GestureDetector(
          //             onTap: (){},
          //             child: Container(
          //               padding: EdgeInsets.all(9),
          //               decoration: BoxDecoration(
          //                 shape: BoxShape.circle,
          //                 color: Color(0xFFFF6B00),
          //               ),
          //               child: Image.asset(
          //                 'assets/img/prof/editingIcon.png',
          //                 width: 15,
          //                 height: 15,
          //               ),
          //             ),
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
          // ),
          // SizedBox(height: 17),
          // Text('Загрузить аватар',textAlign: TextAlign.center,style: TextStyle(color: Color(0xFF515151),fontSize: 16,fontWeight: FontWeight.w400)),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text('Подать объявление',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w400)),
          ),
          SizedBox(height: 30),
          ListTile(
            contentPadding: EdgeInsets.only(left: 35, right: 20, bottom: 0),
            leading: Text(
              'Загрузите фото',
              style: TextStyle(
                  color: Color(0xFF515151),
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
            trailing: IconButton(
                onPressed: () {
                  imageFile = [];
                  setState(() {});
                },
                icon: Icon(
                  Icons.delete_outline,
                  color: Colors.orange,
                )),
          ),
          /*Padding(
            padding: const EdgeInsets.only(left: 39.0),
            child: Text('Загрузите фото',
                style: TextStyle(
                    color: Color(0xFF515151),
                    fontSize: 16,
                    fontWeight: FontWeight.w400)),
          ),*/

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (imageFile.length > 0)
                  Container(
                    height: 80,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, _) => SizedBox(width: 5),
                      itemCount: imageFile.length,
                      itemBuilder: (context, index) => Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: AppColors.blue,
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(File(imageFile[index].path)),
                            )),
                      ),
                    ),
                  ),
                SizedBox(
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
                        color: AppColors.blue,
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.add, color: Color(0xFFFF6B00), size: 25),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 19.0),
                  child: Text('Категория',
                      style: TextStyle(
                          color: Color(0xFF515151),
                          fontSize: 16,
                          fontWeight: FontWeight.w400)),
                ),
                SizedBox(height: 7),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SelectCategory())),
                  child: Container(
                      padding: EdgeInsets.only(left: 19, top: 13),
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: AppColors.blue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Provider.of<SelectCatProvider>(context).category ==
                              ''
                          ? Text('Выберите категорию',
                              style: TextStyle(
                                color: Color(0xFFA6A6A6),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ))
                          : Text(
                              Provider.of<SelectCatProvider>(context).category,
                              style: TextStyle(
                                color: AppColors.blue,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ))),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 19.0),
                  child: Text('Название',
                      style: TextStyle(
                          color: Color(0xFF515151),
                          fontSize: 16,
                          fontWeight: FontWeight.w400)),
                ),
                SizedBox(height: 7),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 19),
                  height: 45,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: AppColors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: name,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        border: InputBorder.none,
                        hintText: 'Название объявления',
                        hintStyle: TextStyle(
                          color: Color(0xFFA6A6A6),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 19.0),
                  child: Text('Описания объявления',
                      style: TextStyle(
                          color: Color(0xFF515151),
                          fontSize: 16,
                          fontWeight: FontWeight.w400)),
                ),
                SizedBox(height: 7),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 19),
                  height: 90,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: AppColors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: description,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        border: InputBorder.none,
                        hintText: 'Введите описание',
                        hintStyle: TextStyle(
                          color: Color(0xFFA6A6A6),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 19.0),
                  child: Text('Цена',
                      style: TextStyle(
                          color: Color(0xFF515151),
                          fontSize: 16,
                          fontWeight: FontWeight.w400)),
                ),
                SizedBox(height: 7),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 19),
                  height: 45,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: AppColors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: price,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        border: InputBorder.none,
                        hintText: 'Введите цену',
                        hintStyle: TextStyle(
                          color: Color(0xFFA6A6A6),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ),
                SizedBox(height: 30),
                /*Padding(
                  padding: const EdgeInsets.only(left: 19.0),
                  child: Text('Время и дата',
                      style: TextStyle(
                          color: Color(0xFF515151),
                          fontSize: 16,
                          fontWeight: FontWeight.w400)),
                ),
                SizedBox(height: 7),
                TableCalendar(
                  headerStyle: HeaderStyle(formatButtonVisible: false),
                  // rangeSelectionMode: RangeSelectionMode,

                  // today's date
                  focusedDay: _focusedDay,
                  // earliest possible date
                  firstDay: kFirstDay,
                  // latest allowed date
                  lastDay: kLastDay,
                  // default view when displayed
                  calendarFormat: CalendarFormat.month,
                  // default is Saturday & Sunday but can be set to any day.
                  // instead of day, a number can be mentioned as well.
                  weekendDays: const [DateTime.sunday, 6],
                  // default is Sunday but can be changed according to locale
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  // height between the day row and 1st date row, default is 16.0
                  daysOfWeekHeight: 40.0,
                  // height between the date rows, default is 52.0
                  rowHeight: 60.0,
                  */ /*selectedDayPredicate: (day) {
                    // Use `selectedDayPredicate` to determine which day is currently selected.
                    // If this returns true, then `day` will be marked as selected.

                    // Using `isSameDay` is recommended to disregard
                    // the time-part of compared DateTime objects.
                    return isSameDay(_selectedDay, day);
                  },*/ /*
                  */ /*onDaySelected: (selectedDay, focusedDay) {
                    if (!isSameDay(_selectedDay, selectedDay)) {
                      // Call `setState()` when updating the selected day
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    }
                  },*/ /*
                  */ /*onFormatChanged: (format) {
                    if (_calendarFormat != format) {
                      // Call `setState()` when updating calendar format
                      setState(() {
                        _calendarFormat = format;
                      });
                    }
                  },*/ /*
                  */ /*onPageChanged: (focusedDay) {
                    // No need to call `setState()` here
                    _focusedDay = focusedDay;
                  },*/ /*
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _selectDate(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 38),
                        height: 45,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: AppColors.blue),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: Text(
                          "${selectedDate1.day}.${selectedDate1.month}.${selectedDate1.year}",
                          style: TextStyle(color: AppColors.blue, fontSize: 16),
                        )),
                      ),
                    ),
                    Text('-',
                        style: TextStyle(color: AppColors.blue, fontSize: 16)),
                    GestureDetector(
                      onTap: () {
                        _selectDate2(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 38),
                        height: 45,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: AppColors.blue),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: Text(
                          "${selectedDate2.day}.${selectedDate2.month}.${selectedDate2.year}",
                          style: TextStyle(color: AppColors.blue, fontSize: 16),
                        )),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 49),*/
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        String descriptionText =
                            name.text + 'name' + description.text;
                        var json = {
                          "description": descriptionText,
                          "price": price.text,
                          "categoryId": Provider.of<SelectCatProvider>(context,
                                  listen: false)
                              .categoryId,
                          "userEmail": emailGet
                        };
                        int ans = await ApiService().postProductAdd(json);
                        if (ans != 0) {
                          print(imageFile[0].path);
                          bool ans2 = await ApiService()
                              .postProductPhotoAdd(imageFile, ans);
                          if (ans2) {
                            Fluttertoast.showToast(
                                msg: 'Успешно добавлено!',
                                fontSize: 18,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.green,
                                textColor: Colors.white);
                          } else {
                            Fluttertoast.showToast(
                                msg: 'Вышла ошибка!',
                                fontSize: 18,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.red,
                                textColor: Colors.white);
                          }
                        } else {
                          Fluttertoast.showToast(
                              msg: 'Error!',
                              fontSize: 18,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.red,
                              textColor: Colors.white);
                        }
                      },
                      child: Ink(
                        width: 125,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Color(0xFFFF6B00),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: Text(
                          'Отправить',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 90),
        ],
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate1,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate1)
      setState(() {
        selectedDate1 = selected;
      });
  }

  _selectDate2(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate2,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate2)
      setState(() {
        selectedDate2 = selected;
      });
  }
}
