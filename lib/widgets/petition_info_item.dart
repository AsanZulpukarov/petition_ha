import 'package:flutter/material.dart';
import 'package:petition_ha/model/petition_model.dart';
import 'package:petition_ha/service/api_service.dart';
import 'package:petition_ha/shared/app_colors.dart';
import 'package:petition_ha/shared/app_text_styles.dart';
import 'package:petition_ha/widgets/static_vote_item.dart';

class PetitionInfoItem extends StatelessWidget {
  const PetitionInfoItem({Key? key, required this.petition}) : super(key: key);
  final Data petition;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.white),
        boxShadow: const [
          BoxShadow(
            color: AppColors.grey,
            blurRadius: 10,
            spreadRadius: 5,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.person,
                color: AppColors.blue,
              ),
              SizedBox(width: 10),
              Expanded(child: Text(petition.creator?.fullName ?? "Пусто")),
            ],
          ),
          Divider(color: AppColors.blue),
          Container(
            height: 160,
            width: double.infinity,
            child: Image.network(
              "https://${ApiService.ip}:${ApiService.port}/uploads/${petition.photo}",
              fit: BoxFit.cover,
            ),
          ),
          Text(
            petition.ruTitle ?? "Пусто",
            maxLines: 1,
            style: AppTextStyles.black16Medium,
          ),
          Text(
            overflow: TextOverflow.ellipsis,
            petition.ruDescription ?? "Пусто",
            maxLines: 2,
            style: AppTextStyles.black14,
          ),
          const Divider(color: AppColors.blue),
          StaticVote(
            currentVote: petition.likeCount!,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "За: ${petition.likeCount}",
                style: AppTextStyles.black16.copyWith(color: AppColors.green),
              ),
              Text(
                "Против: ${petition.disLikeCount}",
                style: AppTextStyles.black16.copyWith(color: Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
