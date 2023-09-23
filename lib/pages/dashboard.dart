import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:petition_ha/pages/search_page.dart';
import 'package:petition_ha/service/api_service.dart';
import 'package:provider/provider.dart';

import '../../fetches/newProducts_fetch.dart';
import '../../fetches/products_fetch.dart';
import '../../model/productModel.dart';
import '../../provider/selectCatProvider.dart';
import '../../shared/app_colors.dart';
import '../category/aboutMagaz.dart';
import '../fetches/categories_fetch.dart';
import '../model/categoriesModel.dart';
import 'categoryProducts.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  late Future<ListProductsModel> futureProducts;
  Future<CategoriesModel>? futureCategories;
  late String emailGet;

  @override
  void initState() {
    super.initState();
    futureProducts = fetchProducts();
    futureCategories=fetchCategories();
    emailGet = Provider.of<SelectCatProvider>(context, listen: false).email;
  }
  bool leftRight = true;

  List<Widget> listN = [
    Stack(
      fit: StackFit.passthrough,
      //overflow: Overflow.visible,
      children: [
        Container(
          width: 332,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFF313131),
              boxShadow: [
                BoxShadow(
                    color: Color(0x40000000).withOpacity(0.25),
                    blurRadius: 10,
                    offset: Offset(0, 6))
              ]),
          child: Padding(
            padding: const EdgeInsets.only(left: 14),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 17,
                  right: 143,
                ),
                child: Text(
                  'Кешбэка много не бывает',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  softWrap: true,
                ),
              ),
              SizedBox(height: 7),
              Padding(
                padding: const EdgeInsets.only(right: 112),
                child: Text(
                  "Летай сколько угодно, получай за каждую покупку до 15%",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                  softWrap: true,
                ),
              ),
              SizedBox(
                height: 31,
              ),
              Text(
                'До 30.05.2023',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
              SizedBox(
                height: 8,
              )
            ]),
          ),
        ),
        Positioned(
            bottom: 10,
            right: 8,
            child: Image.asset(
              'assets/img/kesh.png',
              height: 180,
              width: 122,
            ))
      ],
    ),
    Stack(
      fit: StackFit.passthrough,
      //overflow: Overflow.visible,
      children: [
        Container(
          width: 332,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFF313131),
              boxShadow: [
                BoxShadow(
                    color: Color(0x40000000).withOpacity(0.25),
                    blurRadius: 10,
                    offset: Offset(0, 6))
              ]),
          child: Padding(
            padding: const EdgeInsets.only(left: 14),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 17,
                  right: 143,
                ),
                child: Text(
                  'Кешбэка много не бывает',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  softWrap: true,
                ),
              ),
              SizedBox(height: 7),
              Padding(
                padding: const EdgeInsets.only(right: 112),
                child: Text(
                  "Летай сколько угодно, получай за каждую покупку до 15%",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                  softWrap: true,
                ),
              ),
              SizedBox(
                height: 31,
              ),
              Text(
                'До 30.12.2020',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
              SizedBox(
                height: 8,
              )
            ]),
          ),
        ),
        Positioned(
            bottom: 10,
            right: 8,
            child: Image.asset(
              'assets/img/kesh.png',
              height: 180,
              width: 122,
            ))
      ],
    ),
    Stack(
      fit: StackFit.passthrough,
      //overflow: Overflow.visible,
      children: [
        Container(
          width: 332,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFF313131),
              boxShadow: [
                BoxShadow(
                    color: Color(0x40000000).withOpacity(0.25),
                    blurRadius: 10,
                    offset: Offset(0, 6))
              ]),
          child: Padding(
            padding: const EdgeInsets.only(left: 14),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 17,
                  right: 143,
                ),
                child: Text(
                  'Кешбэка много не бывает',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  softWrap: true,
                ),
              ),
              SizedBox(height: 7),
              Padding(
                padding: const EdgeInsets.only(right: 112),
                child: Text(
                  "Летай сколько угодно, получай за каждую покупку до 15%",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                  softWrap: true,
                ),
              ),
              SizedBox(
                height: 31,
              ),
              Text(
                'До 30.12.2020',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
              SizedBox(
                height: 8,
              )
            ]),
          ),
        ),
        Positioned(
            bottom: 10,
            right: 8,
            child: Image.asset(
              'assets/img/kesh.png',
              height: 180,
              width: 122,
            ))
      ],
    ),
  ];
  int slideIndex = 0;
  List<String> CategoryName = [
    'Магазины',
    'Активный отдых',
    'Кино и театры',
    'Кафе и рестораны',
    'Для детей',
    'Игровые клубы',
    'Сауны и бани',
    'Отели и хостелы',
    'Аптеки',
    'Автоуслуги и товары',
    'Косметика и парфюмерия',
    'Оптика',
    'Аксессуары',
    'Товары для дома',
    'Ювелирные изделия',
    'Красота и здровье',
    'SPA и косметология',
    'Химчистка',
    'Зоомагазины',
    'Другое',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/img/logo.png'))),
        ),
        // elevation: 0,
        backgroundColor: Colors.white,

        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SearchProducts()));
            },
            icon: Icon(
              Icons.search,
              color: AppColors.blue1,
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async{
          setState(() {

          });
        },
        child: ListView(

            children: [
              SizedBox(
                height: 30,
              ),
              /*Padding(
                padding: EdgeInsets.only(left: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: 330,
                      height: 55,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Color(0xFF225196),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Я ищу...",
                            hintStyle: TextStyle(color: Color(0xFF225196)),
                            prefixIcon: Icon(Icons.search,color: AppColors.blue1,),
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                        child: IconButton(
                      icon: Icon(Icons.filter_alt_outlined,
                          color: AppColors.blue1, size: 28),
                      onPressed: () {
                        *//*Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const Filtr()));*//*
                      },
                    ))
                  ],
                ),
              ),*/
              SizedBox(height: 26),
              CarouselSlider(
                items: listN,
                options: CarouselOptions(
                  pageSnapping: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      slideIndex = index;
                    });
                  },
                  height: 160,
                  viewportFraction: 1,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 5),
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 14,
                    height: 1,
                    color: slideIndex == 0 ? AppColors.red1 : Color(0xFFC4C4C4),
                  ),
                  SizedBox(width: 9),
                  Container(
                    width: 14,
                    height: 1,
                    color: slideIndex == 1 ? AppColors.red1 : Color(0xFFC4C4C4),
                  ),
                  SizedBox(width: 9),
                  Container(
                    width: 14,
                    height: 1,
                    color: slideIndex == 2 ? AppColors.red1 : Color(0xFFC4C4C4),
                  ),
                ],
              ),
              ListTile(
                leading: Text(
                  'Категории',
                  style: TextStyle(color: Color(0xFF313131), fontSize: 16),
                ),
                trailing: Text(
                  'Всё',
                  style: TextStyle(color: Color(0xFF8D8D8D), fontSize: 12),
                ),
              ),
              FutureBuilder<CategoriesModel>(
                future: fetchCategories(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var items=snapshot.data!.data!.length;
                    var path=snapshot.data!;
                    return
                      Container(
                        padding: EdgeInsets.only(left: 14),
                        height: 110,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, _) => SizedBox(width: 0),
                          itemCount: items,
                          itemBuilder: (context, index) => Category(path.data![index].id.toString(),
                              path.data![index].name!, path.data![index].path!),
                        ),
                      );
                  }else if (snapshot.hasError) {
                    return Text('${snapshot.error}');;
                  }

                  // By default, show a loading spinner.
                  return Center(child:  CircularProgressIndicator());
                },),

              // ListTile(
              //   leading: Text(
              //     'Рекомендуемые',
              //     style: TextStyle(color: Color(0xFF313131), fontSize: 16),
              //   ),
              //   title: Image.asset(
              //     'assets/img/hotKeshIcon.png',
              //     width: 20,
              //     height: 20,
              //     alignment: Alignment.topLeft,
              //   ),
              //   trailing: Text(
              //     'Всё',
              //     style: TextStyle(color: Color(0xFF313131), fontSize: 12),
              //   ),
              // ),
              // // Padding(
              // //   padding: const EdgeInsets.only(left: 14.0),
              // //   child: Container(
              // //     height: 150,
              // //     child: ListView(
              // //       scrollDirection: Axis.horizontal,
              // //       children: [
              // //         HotKesh(0, 5, 193, 'Бир Эки бургер', 'Fast food', 25),
              // //         SizedBox(width: 10),
              // //         HotKesh(1, 3, 27, 'Enter kg', 'Электро техника', 16)
              // //       ],
              // //     ),
              // //   ),
              // // ),
              // ListTile(
              //   leading: Text(
              //     'Новинки',
              //     style: TextStyle(color: Color(0xFF313131), fontSize: 16),
              //   ),
              //   title: Image.asset(
              //     'assets/img/newIcon.png',
              //     width: 20,
              //     height: 20,
              //     alignment: Alignment.topLeft,
              //   ),
              //   trailing: Text(
              //     'Всё',
              //     style: TextStyle(color: Color(0xFF8D8D8D), fontSize: 12),
              //   ),
              // ),
              // // Padding(
              // //   padding: const EdgeInsets.only(left: 14.0),
              // //   child: Container(
              // //     height: 150,
              // //     child: ListView(
              // //       scrollDirection: Axis.horizontal,
              // //       children: [
              // //         HotKesh(2, 4, 193, 'Baby Store', 'Для детей', 14),
              // //         SizedBox(width: 10),
              // //         HotKesh(3, 5, 27, 'Cinematika', 'Кино и театр', 24)
              // //       ],
              // //     ),
              // //   ),
              // // ),
              // ListTile(
              //   leading: Text(
              //     'Товары',
              //     style: TextStyle(color: Color(0xFF313131), fontSize: 16),
              //   ),
              //   trailing: Text(
              //     'Всё',
              //     style: TextStyle(color: Color(0xFF8D8D8D), fontSize: 12),
              //   ),
              // ),
              // // Padding(
              // //   padding: const EdgeInsets.only(left: 14.0),
              // //   child: Container(
              // //     height: 115,
              // //     child: ListView(
              // //       scrollDirection: Axis.horizontal,
              // //       children: [
              // //         Magazine(0, 4.5, 'Эльдорадо', 'электро техника'),
              // //         SizedBox(width: 10),
              // //         Magazine(1, 4, 'LC waikiki', 'Одежда и обувь'),
              // //         SizedBox(width: 10),
              // //         Magazine(2, 5, 'Derimod', 'Одежда и обувь'),
              // //       ],
              // //     ),
              // //   ),
              // // ),
              SizedBox(
                height: 47,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Container(
                  height: 35,
                  decoration: BoxDecoration(
                    color: Color(0xFFEBEBEB),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              leftRight = true;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: leftRight ? AppColors.red1 : null),
                            child: Center(
                              child: Text(
                                'Рекомендуемые',
                                style: TextStyle(
                                    color:
                                        leftRight ? Colors.white : Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400)  ,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              leftRight = false;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: leftRight ? null : AppColors.red1),
                            child: Center(
                              child: Text(
                                'Новые',
                                style: TextStyle(
                                    color:
                                        leftRight ? Colors.black : Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
    FutureBuilder<ListProductsModel>(
    future: futureProducts,
    builder: (context, snapshot) {
    if (snapshot.hasData) {
    var items=snapshot.data!.data!.length;
    return
              Padding(
                padding: const EdgeInsets.only(left: 14.0),
                child: Wrap(
                  runSpacing: 20,
                  spacing: 10,
                  // scrollDirection: Axis.horizontal,
                  children: leftRight
                      ? [
                          /*HotKesh(0, 5, 193, 'Бир Эки бургер', 'Fast food', 25),
                          SizedBox(width: 10),
                          HotKesh(1, 3, 27, 'Enter kg', 'Электро техника', 16),
                          SizedBox(width: 10),
                          HotKeshSecond('/images/1025f602-1814-422a-9b05-be25b5377389.png', 5, 193, 'Сатылат', 'Fast food', 25),
                          SizedBox(width: 10),
                          HotKeshSecond('/images/9492e584-e0bc-4d98-a06b-b55d60afd380.jpg', 3, 27, 'Телефон', 'Электро техника', 16),
                          SizedBox(width: 10),
                          HotKeshSecond('/images/3949ff22-45a3-4251-95d4-1dc2d43f289e.jpg', 2, 42, 'Продается', 'Электро техника', 16),*/
                    for (var i=0;i<items;i++)
                      HotKeshSecond(snapshot.data!.data![i].images!.length>0 ? snapshot.data!.data![i].images![0] : null, 3, snapshot.data!.data![i].description!, snapshot.data!.data![i].price.toString(),((snapshot.data!.data![i].id!).toString()),emailGet),

                        ]
                      : [
                    for (var i=items-1;i>=0;i--)
                      HotKeshSecond(snapshot.data!.data![i].images!.length>0 ? snapshot.data!.data![i].images![0] : null, 3, snapshot.data!.data![i].description!, snapshot.data!.data![i].price.toString(),((snapshot.data!.data![i].id!).toString()),emailGet),
                          /*HotKesh(2, 4, 193, 'Baby Store', 'Для детей', 14),
                          SizedBox(width: 10),
                          HotKesh(3, 5, 27, 'Cinematika', 'Кино и театр', 24)*/
                        ],
                ),
              );}else if (snapshot.hasError) {
        return Text('${snapshot.error}');;
    }

    // By default, show a loading spinner.
    return Center(child:  CircularProgressIndicator());
    },),
              SizedBox(height: 40),
            ],
        ),
      ),
    );
  }

  Widget Magazine(int image, double rat, String name, String cat) {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5, top: 13, bottom: 17),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Color(0x1A000000).withOpacity(0.1),
                blurRadius: 4,
                offset: Offset(0, 4)),
          ],
          border: Border.all(
              width: 0.5, color: Color(0xFF929292).withOpacity(0.37)),
          borderRadius: BorderRadius.circular(10)),
      child: Container(
        width: 100,
        child: Column(
          children: [
            Image.asset(
              'assets/img/magazine/mag$image.png',
              width: 90,
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RatingBar.builder(
                    initialRating: rat,
                    itemSize: 12,
                    itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: AppColors.mainRed,
                        ),
                    onRatingUpdate: (rating) {}),
                SizedBox(width: 2.5),
                Text(
                  '$rat',
                  style: TextStyle(color: AppColors.mainRed, fontSize: 12),
                ),
              ],
            ),
            SizedBox(height: 9),
            Text(
              name,
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
            Text(
              cat=='null'?"Договорная":cat,
              style: TextStyle(color: Colors.black, fontSize: 10),
            )
          ],
        ),
      ),
    );
  }

  Widget Category(String id,String name, String image) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => CategoryProducts(categoryId: id,categoryName: name)));
      },
      child: Container(
        width: 89,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0x1A000000).withOpacity(0.1),
                        blurRadius: 4,
                        offset: Offset(0, 4)),
                  ],
                  border: Border.all(
                      width: 0.5, color: Color(0xFF929292).withOpacity(0.37)),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(22),
                child: Image.network(
                  'http://${ApiService.ip}/$image',
                  height: 22,
                  width: 22,
                ),
              ),
            ),
            SizedBox(height: 13),
            Text(
              name,
              style: TextStyle(color: Colors.black, fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget HotKesh(
      int image, double rat, int otzyv, String name, String cat, int kesh) {
    return GestureDetector(
      onTap: () {},/*=> Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HotKeshPage())),*/
      child: Container(
        width: 170,
        child: Column(
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 2.5, color: Color(0xFF929292).withOpacity(0.37)),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 7,
                        offset: Offset(0, 6),
                        color: Color(0x33000000))
                  ],
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/img/hotKesh/kesh$image.jpg'))),
            ),
            SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        RatingBar.builder(
                            initialRating: rat,
                            itemSize: 12,
                            itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: AppColors.mainRed,
                                ),
                            onRatingUpdate: (rating) {
                              setState(() {
                                rat = rating;
                              });
                            }),
                        SizedBox(width: 2.5),
                        Text(
                          '$rat',
                          style:
                              TextStyle(color: AppColors.mainRed, fontSize: 12),
                        ),
                        SizedBox(width: 2),
                        Text(
                          '($otzyv отзыва)',
                          style:
                              TextStyle(color: Color(0xFF313131), fontSize: 10),
                        )
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(
                      name,
                      style: TextStyle(color: Color(0xFF313131), fontSize: 12),
                    ),
                    SizedBox(height: 5),
                    Text(
                      cat,
                      style: TextStyle(color: Color(0xFF8D8D8D), fontSize: 10),
                    )
                  ],
                ),
                SizedBox(width: 5),
                Container(
                  width: 20,
                  child: Text(
                    'до $kesh%',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColors.green, fontSize: 10),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget HotKeshSecond(
      String? image, double rat,  String name, String cat,String productId,String email) {
    List<String> nameAndDescription=[name.split('name').first,name.split('name').last];
    return InkWell(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => AboutMagaz(productId: productId,email: email,checkUserPage: false,))),
      child: Ink(
        width: 170,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 2.5, color: Color(0xFF929292).withOpacity(0.37)),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 7,
                        offset: Offset(0, 6),
                        color: Color(0x33000000))
                  ],
                  image:image!=null ? DecorationImage(
                      fit: BoxFit.cover,
                      image:  NetworkImage('http://${ApiService.ip}/$image')  )
                      : DecorationImage(
                      fit: BoxFit.cover,
                      image:  AssetImage('assets/img/hotKesh/kesh0.jpg') )
              ),
            ),
            SizedBox(height: 12),
                    /*Row(
                      children: [
                        RatingBar.builder(
                            initialRating: rat,
                            itemSize: 12,
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: AppColors.mainRed,
                            ),
                            onRatingUpdate: (rating) {
                              setState(() {
                                rat = rating;
                              });
                            }),
                        SizedBox(width: 2.5),
                        Text(
                          '$rat',
                          style:
                          TextStyle(color: AppColors.mainRed, fontSize: 12),
                        ),
                      ],
                    ),*/
                    SizedBox(height: 5),
                    Container(

                      child: Text(
                        nameAndDescription[0],
                        style: TextStyle(color: Color(0xFF313131), fontSize: 16),
                        overflow: TextOverflow.clip,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      cat=='null'?"Договорная": cat.split('.').first+' сом',
                      style: TextStyle(color: Colors.orange, fontSize: 14),
                    )




          ],
        ),
      ),
    );
  }
}
