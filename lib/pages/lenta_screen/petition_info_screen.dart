import 'package:flutter/material.dart';
import 'package:petition_ha/model/petition_model.dart';
import 'package:petition_ha/pages/lenta_screen/comment_page.dart';

import '../../service/api_service.dart';
import '../../shared/app_colors.dart';
import '../../shared/app_text_styles.dart';
import '../../widgets/static_vote_item.dart';

class InfoPetitionScreen extends StatefulWidget {
  InfoPetitionScreen({Key? key, required this.petition}) : super(key: key);

  final Data petition;

  @override
  State<InfoPetitionScreen> createState() => _InfoPetitionScreenState();
}

class _InfoPetitionScreenState extends State<InfoPetitionScreen> {
  final _styleInButtonText =
      AppTextStyles.black12.copyWith(color: AppColors.white);

  bool isShowComment = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: double.infinity,
              child: Image.network(
                "https://${ApiService.ip}:${ApiService.port}/uploads/${widget.petition.photo}",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text(
              widget.petition.ruTitle ?? "Пусто",
              style: AppTextStyles.black16Medium,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: SingleChildScrollView(
                child: Text(
                  widget.petition.ruDescription ?? "Пусто",
                  style: AppTextStyles.black14,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Анализ ИИ",
              style: AppTextStyles.black16,
            ),
            SizedBox(height: 5),
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: SingleChildScrollView(
                child: Text(
                  'Оценка законопроекта по шкале от 1 до 10 составляет 8. Законопроект предлагает правила и нормы для защиты и благополучия животных, а также для защиты диких животных и их местообитаний. Он также устанавливает обязанности обладателей животных и предусматривает меры надзора и контроля со стороны соответствующих органов. Законопроект также предусматривает наказание за нарушения и проведение образовательных программ по защите прав животных. Он может затронуть многие сферы жизни населения, включая производство, торговлю, образование, медицину и т.д. Он может привести к положительным изменениям в жизни населения, поэтому оценка законопроекта по шкале от 1 до 10 составляет 8.',
                  // widget.petition.ruDescription ?? "Пусто",
                  style: AppTextStyles.black14,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (widget.petition.isLike == null ||
                          widget.petition.isLike == true) {
                        if (widget.petition.likeCount! - 1 == 0) {
                          widget.petition.likeCount =
                              widget.petition.likeCount! - 1;
                        }
                        widget.petition.disLikeCount =
                            widget.petition.disLikeCount! + 1;
                        widget.petition.isLike = false;
                        setState(() {});
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.mainRed,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.mainRed),
                      ),
                      child: Column(
                        children: [
                          Text("Против", style: _styleInButtonText),
                          Text(widget.petition.disLikeCount.toString(),
                              style: _styleInButtonText),
                          Text(
                            "Голос",
                            style: _styleInButtonText,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 40),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    if (widget.petition.isLike == null ||
                        widget.petition.isLike == false) {
                      if (widget.petition.disLikeCount! - 1 == 0) {
                        widget.petition.disLikeCount =
                            widget.petition.disLikeCount! - 1;
                      }
                      widget.petition.likeCount =
                          widget.petition.likeCount! + 1;

                      widget.petition.isLike = true;
                      setState(() {});
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.green,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.green),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "За",
                          style: _styleInButtonText,
                        ),
                        Text(
                          widget.petition.likeCount.toString(),
                          style: _styleInButtonText,
                        ),
                        Text(
                          "Голос",
                          style: _styleInButtonText,
                        ),
                      ],
                    ),
                  ),
                )),
              ],
            ),
            const Divider(color: AppColors.blue),
            StaticVote(
              currentVote: widget.petition.likeCount!,
            ),
            Container(
              width: double.infinity,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.chat,
                    color: AppColors.blue,
                  ),
                  const Text("Открыть комментарии"),
                  IconButton(
                      onPressed: () {
                        isShowComment = !isShowComment;
                        setState(() {});
                      },
                      icon: Icon(
                        isShowComment
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: isShowComment ? AppColors.black : AppColors.blue,
                      ))
                ],
              ),
            ),
            if (isShowComment)
              Container(
                  child: CommentPage(idPetition: widget.petition.id ?? 1)),
          ],
        ),
      ),
    );
  }
}
