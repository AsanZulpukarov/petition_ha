import 'dart:developer';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:petition_ha/amansCreate/petitions_fetch.dart';
import 'package:petition_ha/amansCreate/service_aman.dart';
import 'package:petition_ha/amansCreate/petitionsModel.dart';
import 'package:petition_ha/service/api_service.dart';
import 'package:petition_ha/widgets/appBar.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:swipe/swipe.dart';

import '../view/auth/sing_in/sing_in_screen.dart';

class SecondHomeScreen extends StatefulWidget {
  @override
  State<SecondHomeScreen> createState() => _SecondHomeScreenState();
}

class _SecondHomeScreenState extends State<SecondHomeScreen> {
  TextEditingController controller = TextEditingController();
  FlutterTts flutterTts = FlutterTts();
  String text='''Государь!                                                      251
     Мы, рабочие и жители города С.-Петербурга  разных  сословий,
наши жены,  и дети, и беспомощные старцы-родители, пришли к тебе,
государь,  искать правды и защиты.  Мы  обнищали,  нас  угнетают,
обременяют  непосильным  трудом,  над нами надругаются,  в нас не
признают людей,  к нам относятся  как  к  рабам,  которые  должны
терпеть  свою  горькую  участь  и молчать.''';

  double volume = 1.0;
  double pitch = 1.0;
  double speechRate = 0.5;
  List<String>? languages;
  String langCode = "ru-RU";

  stt.SpeechToText? _speech;
  bool _isListening = false;
  String _text='';
  var index=0;
  bool ans=false;

  @override
  void initState() {
    super.initState();
    init();
    _speech = stt.SpeechToText();
  }


  void init() async {
    languages = List<String>.from(await flutterTts.getLanguages);
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AllAppBar(),
        body:
        FutureBuilder<PetitionsModel>(
          future: fetchPetitions(),
          builder: (context, snapshot) {

            if (snapshot.hasData) {
              var path=snapshot.data!;
              var len=path.data!.length;
              String speechText;
              return
                GestureDetector(
                  excludeFromSemantics: true,
                  onLongPress: () async{
                    print('Long');
                    if (!_isListening) {
                      bool available = await _speech!.initialize(
                        onStatus: (val) => print('onStatus: $val'),
                        onError: (val) => print('onError: $val'),
                      );
                      if (available) {
                        setState(() => _isListening = true);
                        _speech!.listen(
                          onResult: (val) => setState(() {
                            _text = val.recognizedWords;
                          }),
                        );
                      }

                    } else {
                      setState(() => _isListening = false);
                      _speech!.stop();
                      ans=await ServiceAman().postPetitionComment(path.data![index].id!,_text);
                      if(ans){
                        await flutterTts.speak('Комментарие записано');
                      }else{
                        await flutterTts.speak('Вышла ошибка');
                      }

                    }
                    print(_text);
                  },
                  child: Swipe(
                    onSwipeDown: ()async{
                      print('down');
                      bool ans=await ServiceAman().postPetitionLike(path.data![index].id!,false);
                      if(ans)
                        await flutterTts.speak('Вы проголосовали против петиции');
                      else await flutterTts.speak('Голосование не удалось');
                    },
                    onSwipeLeft: ()async{
                      print('left');
                      index--;
                      if(index<0) index=len-1;
                      if(index>len-1) index=0;
                      speechText='Назнание петиции ${path.data![index].ruTitle}, Описание, ${path.data![index].ruDescription}';
                      await flutterTts.setVolume(volume);
                      await flutterTts.setPitch(pitch);
                      await flutterTts.setSpeechRate(speechRate);
                      await flutterTts.setLanguage(langCode);
                      await flutterTts.speak(speechText);
                    },
                    onSwipeRight: ()async{
                      print('right');
                      index++;
                      if(index<0) index=len-1;
                      if(index>len-1) index=0;
                      speechText='Назнание петиции ${path.data![index].ruTitle}, Описание, ${path.data![index].ruDescription}';
                      await flutterTts.setVolume(volume);
                      await flutterTts.setPitch(pitch);
                      await flutterTts.setSpeechRate(speechRate);
                      await flutterTts.setLanguage(langCode);
                      await flutterTts.speak(speechText);
                    },
                    onSwipeUp: ()async{
                      print('Up');
                      bool ans=await ServiceAman().postPetitionLike(path.data![index].id!,true);
                      if(ans)
                        await flutterTts.speak('Вы проголосовали за петицию');
                      else await flutterTts.speak('Голосование не удалось');
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width, // Задайте желаемую ширину
                      height: MediaQuery.of(context).size.height, // Задайте желаемую высоту
                      decoration: BoxDecoration(// Делает контейнер круглым
                        color: Colors.blue, // Цвет фона
                      ),
                      child: AvatarGlow(
                        animate: _isListening,
                        glowColor: Theme.of(context).primaryColor,
                        endRadius: 75.0,
                        duration: const Duration(milliseconds: 2000),
                        repeatPauseDuration: const Duration(milliseconds: 100),
                        repeat: true,
                        child: Center(
                          child: Icon(_isListening ? Icons.mic : Icons.mic_none,color: Colors.white,size: 100,)/*Text(
                        text,
                        style: TextStyle(
                          color: Colors.white, // Цвет текста
                          fontWeight: FontWeight.bold,
                        ),
                    )*/,
                        ),
                      ),
                    ),
                  ),
                );
            }else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return Center(child: const CircularProgressIndicator());
          },),
      ),
    );
  }

  void initSetting() async {
    await flutterTts.setVolume(volume);
    await flutterTts.setPitch(pitch);
    await flutterTts.setSpeechRate(speechRate);
    await flutterTts.setLanguage(langCode);
  }

  void _speak() async {
    initSetting();
    await flutterTts.speak(controller.text);
  }

  void _stop() async {
    await flutterTts.stop();
  }
}

