import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petition_ha/service/api_service.dart';
import 'package:provider/provider.dart';

import '../../../fetches/newProducts_fetch.dart';
import '../../../fetches/products_fetch.dart';
import '../../../fetches/userData_fetch.dart';
import '../../../model/productModel.dart';
import '../../../provider/selectCatProvider.dart';
import '../../../shared/app_colors.dart';
import '../../../widgets/appBar2.dart';
import '../../category/aboutMagaz.dart';
import '../../model/userDataModel.dart';

class ProfileUser extends StatefulWidget {
  final emailUser;
  const ProfileUser({Key? key, required this.emailUser}) : super(key: key);
  @override
  _ProfileUserState createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {
  late Future<ListProductsModel> futureProducts;
  late Future<UserDataModel> futureUserData;
  late String imageProfile;
  late String emailGet;

  @override
  void initState() {
    super.initState();
    emailGet = Provider.of<SelectCatProvider>(context, listen: false).email;
    futureProducts = fetchProfileProducts(widget.emailUser);
    futureUserData = fetchUserData(widget.emailUser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AllAppBar2(),
      body: ListView(
        padding: EdgeInsets.only(left: 14, right: 14, top: 5),
        children: [
          Container(
            width: 142,
            height: 142,
            padding: EdgeInsets.all(9),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5,
                      offset: Offset(0, 0),
                      color: Color(0x26000000))
                ]),
            child: Container(
              padding: EdgeInsets.all(9),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5,
                        offset: Offset(0, 0),
                        color: Color(0x26000000))
                  ]),
              child: Stack(
                //overflow: Overflow.visible,
                children: [
                  FutureBuilder<UserDataModel>(
                    future: futureUserData,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var path = snapshot.data!;
                        imageProfile =
                            'https://${ApiService.ip}/${path.avatar}';
                        return Positioned(
                            top: 0,
                            left: 111,
                            child: path.avatar != null
                                ? CircleAvatar(
                                    radius: 53,
                                    backgroundImage: NetworkImage(
                                        'https://${ApiService.ip}/${path.avatar}'))
                                : CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 53,
                                    backgroundImage:
                                        AssetImage('assets/img/user.png'),
                                  ));
                        /*Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: 0.5,
                          color: Color(0xFF929292).withOpacity(0.37)),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 16,
                            offset: Offset(0, 0),
                            color: Color(0x33000000))
                      ],
                      image: path.avatar!=null ? DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage('https://${AuthClient().ip}/${path.avatar}')):DecorationImage(
                          image: AssetImage('assets/img/user.png')) ,
                    ),
                  );*/
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }

                      // By default, show a loading spinner.
                      return Center(child: const CircularProgressIndicator());
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 4),
          FutureBuilder<UserDataModel>(
            future: futureUserData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var path = snapshot.data!;
                return Text(
                  path.username != null ? path.username.toString() : 'User',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                  textAlign: TextAlign.center,
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return Center(child: const CircularProgressIndicator());
            },
          ),
          SizedBox(height: 15),
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Color(0xFF313131),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: Stack(
                      children: [
                        Positioned(
                            child: Image.asset(
                              'assets/img/profIconTab1.png',
                              width: 72,
                              height: 72,
                            ),
                            bottom: -28,
                            left: 15),
                        Positioned(
                          top: 20,
                          left: 30,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FutureBuilder<ListProductsModel>(
                                future: futureProducts,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    var items = snapshot.data!.data!.length;
                                    return Text(
                                        items != 0 ? items.toString() : '0',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20));
                                  } else if (snapshot.hasError) {
                                    return Text('${snapshot.error}');
                                  }

                                  // By default, show a loading spinner.
                                  return Center(
                                      child: const CircularProgressIndicator());
                                },
                              ),
                              Text(
                                'Объявлений',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 11),
                  child: VerticalDivider(
                    color: Color(0xFF636363),
                    width: 1,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Stack(
                      children: [
                        Positioned(
                            child: Image.asset(
                              'assets/img/profIconTab2.png',
                              width: 72,
                              height: 72,
                            ),
                            bottom: -28,
                            left: 15),
                        Positioned(
                          top: 15,
                          // left: 22,
                          child: Container(
                            width: 200,
                            child: FutureBuilder<UserDataModel>(
                              future: futureUserData,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  var path = snapshot.data!;
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(path.email.toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16)),
                                      SizedBox(height: 6),
                                      Text(
                                          path.phone != null
                                              ? path.phone.toString()
                                              : '...',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20)),
                                    ],
                                  );
                                } else if (snapshot.hasError) {
                                  return Text('${snapshot.error}');
                                }

                                // By default, show a loading spinner.
                                return Center(
                                    child: const CircularProgressIndicator());
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 11),
                  child: VerticalDivider(
                    color: Color(0xFF636363),
                    width: 1,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              /*   Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AllMagazine()));*/
            },
            // dense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 0),
            leading: Text(
              'Объявления пользователя',
              style: TextStyle(color: Color(0xFF313131), fontSize: 16),
            ),
            trailing: Text(
              'Всё',
              style: TextStyle(color: Color(0xFF8D8D8D), fontSize: 12),
            ),
          ),
          FutureBuilder<ListProductsModel>(
            future: futureProducts,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var items = snapshot.data!.data!.length;
                return Padding(
                  padding: const EdgeInsets.only(left: 14.0),
                  child: Container(
                    height: 200,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, _) => SizedBox(width: 5),
                      itemCount: items,
                      itemBuilder: (context, index) => HotKeshSecond(
                          snapshot.data!.data![index].images!.length > 0
                              ? snapshot.data!.data![index].images![0]
                              : null,
                          3,
                          snapshot.data!.data![index].description!,
                          snapshot.data!.data![index].price.toString(),
                          ((snapshot.data!.data![index].id!).toString()),
                          emailGet),
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return Center(child: const CircularProgressIndicator());
            },
          ),

          /*PokupkiContainer(0, '15.10.20', 'Эльдорадо', '1 200', '649'),
          SizedBox(height: 10),
          PokupkiContainer(2, '10.10.20', 'Derimod', '4 500', '278'),
          SizedBox(height: 10),
          PokupkiContainer(3, '15.10.20', 'Magazin', '1 990', '180'),*/
          SizedBox(height: 33),
          /*Padding(
            padding: const EdgeInsets.symmetric(horizontal: 96),
            child: GestureDetector(
              onTap: (){
              },
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(width: 1,color: AppColors.blue1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: Text('Вывести деньги',style: TextStyle(fontWeight: FontWeight.w500,color: AppColors.blue1,fontSize: 14),)),
              ),
            ),
          ),*/
          /*Divider(height: 1,color: Color(0xFFEBEBEB)),
          CatFun(1, 'Пригласить друга',Referal()),
          // Divider(height: 1,color: Color(0xFFEBEBEB)),
          // CatFun(2, 'Настройки кошелька',PurseSetting()),
          Divider(height: 1,color: Color(0xFFEBEBEB)),
          CatFun(3, 'FAQ',FAQ()),
          Divider(height: 1,color: Color(0xFFEBEBEB)),
          CatFun(4, 'Бизнес профиль',BussinesProf()),
          Divider(height: 1,color: Color(0xFFEBEBEB)),
          ListTile(
            leading: Image.asset('assets/img/prof/catIcon5.png',width: 16,height: 16),
            title: Text('Поделиться приложением',style: TextStyle(color: Color(0xFF313131),fontSize: 16,fontWeight: FontWeight.w400),),
          ),
          Divider(height: 1,color: Color(0xFFEBEBEB)),
        ListTile(
          onTap: ()=>Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => SingInScreen())),
          leading: Image.asset('assets/img/prof/catIcon6.png',width: 16,height: 16),
          title: Text('Выход',style: TextStyle(color: Color(0xFF313131),fontSize: 16,fontWeight: FontWeight.w400),),
        ),
          SizedBox(height: 99),*/
        ],
      ),
    );
  }

  Widget CatFun(int imageIndex, String funName, Widget widgetForCat) {
    return ListTile(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => widgetForCat)),
      leading: Image.asset('assets/img/prof/catIcon$imageIndex.png',
          width: 16, height: 16),
      title: Text(
        funName,
        style: TextStyle(
            color: Color(0xFF313131),
            fontSize: 16,
            fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget PokupkiContainer(
      int imageIndex, String date, String name, String plata, String ostatok) {
    return Container(
      height: 86,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              width: 0.5, color: Color(0xFF929292).withOpacity(0.37)),
          boxShadow: [
            BoxShadow(
              color: Color(0x26000000),
              blurRadius: 5,
            )
          ]),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/img/magazine/mag$imageIndex.png',
                  width: 90,
                  height: 30,
                ),
                SizedBox(height: 6),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image.asset(
                    'assets/img/prof/likeIcon.png',
                    width: 13,
                    height: 13,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    'Оставить отзыв',
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  ),
                ]),
                Text(
                  '$dateг',
                  style: TextStyle(color: Color(0xFF8D8D8D), fontSize: 10),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 11),
            child: VerticalDivider(
              color: Color(0xFFEBEBEB),
              width: 1,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 5),
                Text(
                  name,
                  style: TextStyle(color: Color(0xFF313131), fontSize: 14),
                ),
                SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/img/prof/somIcon.png',
                      width: 15,
                      height: 15,
                    ),
                    SizedBox(width: 5),
                    Text(
                      '$plata сом',
                      style: TextStyle(color: Color(0xFF515151), fontSize: 10),
                    ),
                  ],
                ),
                SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/img/prof/somIcon2.png',
                      width: 15,
                      height: 15,
                    ),
                    SizedBox(width: 3),
                    Text(
                      '$ostatok сом',
                      style: TextStyle(color: Color(0xFF515151), fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget HotKeshSecond(String? image, double rat, String name, String cat,
      String productId, String email) {
    List<String> nameAndDescription = [
      name.split('name').first,
      name.split('name').last
    ];
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AboutMagaz(
                productId: productId,
                email: email,
                checkUserPage: false,
              ))),
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
                  image: image != null
                      ? DecorationImage(
                          fit: BoxFit.cover,
                          image:
                              NetworkImage('https://${ApiService.ip}/$image'))
                      : DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/img/hotKesh/kesh0.jpg'))),
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
              cat == 'null' ? "Договорная" : cat.split('.').first + ' сом',
              style: TextStyle(color: Colors.orange, fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
