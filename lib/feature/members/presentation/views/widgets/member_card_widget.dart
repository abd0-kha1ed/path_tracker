import 'package:flutter/material.dart';
import 'package:robotics_app/core/utils/app_images.dart';
import 'package:robotics_app/feature/members/data/models/card_model.dart';

class MemberCardWidget extends StatelessWidget {
  final Animation<double> animation;

  const MemberCardWidget(
      {super.key, required this.animation, required this.cardModel});
  final CardModel cardModel;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: animation as Animation<double>,
          curve: Curves.easeOutBack,
        )),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: EdgeInsets.zero,
            elevation: 0,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 24,
                  backgroundImage: cardModel.image == null
                      ? AssetImage(Assets.imagesSplashLogo)
                      : AssetImage(
                          cardModel.image as String,
                        ),
                ),
                title: Text(
                  cardModel.name,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(cardModel.subtitle ?? '',
                    style: TextStyle(color: Colors.grey)),
                trailing: Icon(Icons.card_membership),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
