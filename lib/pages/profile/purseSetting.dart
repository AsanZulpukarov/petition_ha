import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../shared/app_colors.dart';
import '../../widgets/appBar2.dart';
import '../profileUsers/toCard.dart';

class PurseSetting extends StatefulWidget {
  const PurseSetting({Key? key}) : super(key: key);

  @override
  _PurseSettingState createState() => _PurseSettingState();
}

class _PurseSettingState extends State<PurseSetting> {
  bool cardTap=false;
  bool purseTab=false;
  int currentPurseTap=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AllAppBar2(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 14),
        children: [
          Text('Настройки кошелька',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w400)),
          SizedBox(height: 27),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Color(0x40000000),
                  offset: Offset(0,4),
                  blurRadius: 11,
                )
              ]
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      cardTap=!cardTap;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    height: 171,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.topRight,
                        colors: [
                          Color(0xFF245398),
                          Color(0xFF75AAF8),
                        ]
                      ),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x40000000),
                          offset: Offset(0,8),
                          blurRadius: 10,
                        )
                      ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/img/prof/purse/qrPurse.png',width: 80,height: 80,),
                            SizedBox(height: 21),
                            Text(
                              'Акиева Айпери',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'ID123456789',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                        Text('3000 c',style: TextStyle(color: Colors.white,fontSize: 20),)
                      ],
                    ),
                  ),
                ),
                if(cardTap) SizedBox(height: 27),
                if(cardTap) Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Выберите способ вывода',style: TextStyle(color: Color(0xFF515151),fontSize: 20),),
                      SizedBox(height: 16),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 14,vertical: 14),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: AppColors.blue1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Электронный кошелек',
                                      style: TextStyle(
                                        color: AppColors.blue1.withOpacity(0.4),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      )),
                                  GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        purseTab=!purseTab;
                                        print(purseTab);
                                      });
                                    },
                                    child: Image.asset('assets/img/prof/faq.png',width: 20,height: 20),
                                  ),
                                ],
                              ),
                              if(purseTab)SizedBox(height: 13),
                              if(purseTab)Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          if(currentPurseTap==1) currentPurseTap=0;
                                          else
                                            currentPurseTap=1;
                                        });
                                      },
                                      child: Column(
                                        children: [
                                          Image.asset('assets/img/prof/purse/O!.png',width: 18,height: 18),
                                          SizedBox(height: 14),
                                          Container(
                                            width: 15,
                                            height: 15,
                                            decoration: BoxDecoration(
                                              color:  currentPurseTap==1 ? AppColors.blue1:null,
                                              shape: BoxShape.circle,
                                              border: Border.all(width: 1,color:AppColors.blue1)
                                            ),
                                            child:currentPurseTap==1? Center(
                                              child: Icon(Icons.check,color: Colors.white,size: 10),
                                            ):null,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          if(currentPurseTap==2) currentPurseTap=0;
                                          else
                                            currentPurseTap=2;
                                        });
                                      },
                                      child: Column(
                                        children: [
                                          Image.asset('assets/img/prof/purse/balance.png',width: 43,height: 18),
                                          SizedBox(height: 14),
                                          Container(
                                            width: 15,
                                            height: 15,
                                            decoration: BoxDecoration(
                                                color: currentPurseTap==2 ? AppColors.blue1:null,
                                                shape: BoxShape.circle,
                                                border: Border.all(width: 1,color: AppColors.blue1)
                                            ),
                                            child:currentPurseTap==2? Center(
                                              child: Icon(Icons.check,color: Colors.white,size: 10),
                                            ):null,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          if(currentPurseTap==3) currentPurseTap=0;
                                          else
                                            currentPurseTap=3;
                                        });
                                      },
                                      child: Column(
                                        children: [
                                          Image.asset('assets/img/prof/purse/megaPay.png',width: 63,height: 18),
                                          SizedBox(height: 14),
                                          Container(
                                            width: 15,
                                            height: 15,
                                            decoration: BoxDecoration(
                                                color: currentPurseTap==3 ? AppColors.blue1:null,
                                                shape: BoxShape.circle,
                                                border: Border.all(width: 1,color: AppColors.blue1)
                                            ),
                                            child:currentPurseTap==3? Center(
                                              child: Icon(Icons.check,color: Colors.white,size: 10),
                                            ):null,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )),
                      SizedBox(height: 11),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 14),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: AppColors.blue1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                              color: AppColors.blue1,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                    color: AppColors.blue1.withOpacity(0.4),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                              hintText: 'Введите сумму'
                            ),
                          )
                      ),
                      SizedBox(height: 29),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 56.0),
                        child: GestureDetector(
                          onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder:(context)=>ToCard())),
                          child: Container(
                            height: 44,
                            decoration: BoxDecoration(
                              color: AppColors.red1,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Center(
                              child: Text('Вывести деньги',style: TextStyle(color: Colors.white,fontSize: 14),),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40)
                    ],
                  ),
                ),

              ],
            ),
          ),
          SizedBox(
            height: 31
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'История',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                'Все',
                style: TextStyle(
                  color: Color(0xFF898989),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(height: 11),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 0.5,
                        color:
                        Color(0xFF929292).withOpacity(0.37)),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x1A000000),
                        offset: Offset(0, 4),
                      )
                    ]),
                child:
                Image.asset('assets/img/notif/moneyIcon.png'),
              ),
              SizedBox(width: 19),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'На карту было выведено 1520 сом',
                    style: TextStyle(
                        color: Color(0xFF313131),
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        '14.10.2020',
                        style: TextStyle(
                            color: Color(0xFF6B6B6B),
                            fontSize: 10,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(width: 19),
                      Text('21:44',
                          style: TextStyle(
                              color: Color(0xFF6B6B6B),
                              fontSize: 10,
                              fontWeight: FontWeight.w300))
                    ],
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 0.5,
                        color:
                        Color(0xFF929292).withOpacity(0.37)),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x1A000000),
                        offset: Offset(0, 4),
                      )
                    ]),
                child:
                Image.asset('assets/img/notif/moneyIcon.png'),
              ),
              SizedBox(width: 19),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'На карту было выведено 1520 сом',
                    style: TextStyle(
                        color: Color(0xFF313131),
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        '14.10.2020',
                        style: TextStyle(
                            color: Color(0xFF6B6B6B),
                            fontSize: 10,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(width: 19),
                      Text('21:44',
                          style: TextStyle(
                              color: Color(0xFF6B6B6B),
                              fontSize: 10,
                              fontWeight: FontWeight.w300))
                    ],
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 0.5,
                        color:
                        Color(0xFF929292).withOpacity(0.37)),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x1A000000),
                        offset: Offset(0, 4),
                      )
                    ]),
                child:
                Image.asset('assets/img/notif/moneyIcon.png'),
              ),
              SizedBox(width: 19),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'На карту было выведено 1520 сом',
                    style: TextStyle(
                        color: Color(0xFF313131),
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        '14.10.2020',
                        style: TextStyle(
                            color: Color(0xFF6B6B6B),
                            fontSize: 10,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(width: 19),
                      Text('21:44',
                          style: TextStyle(
                              color: Color(0xFF6B6B6B),
                              fontSize: 10,
                              fontWeight: FontWeight.w300))
                    ],
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 35),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 54.0),
            child: GestureDetector(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1,color: AppColors.red1)
                ),
                child: Center(
                  child: Text('Вывести деньги на карту',style: TextStyle(color:AppColors.red1,fontSize: 14)),
                ),
              ),
            ),
          ),
          SizedBox(height: 60)
        ],
      ),
    );
  }
}
