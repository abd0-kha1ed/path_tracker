import 'package:flutter/material.dart';
import 'package:robotics_app/core/utils/app_images.dart';
import 'package:robotics_app/feature/members/data/models/card_model.dart';
import 'package:robotics_app/feature/members/presentation/views/widgets/member_card_widget.dart';

class MembersViewBody extends StatefulWidget {
  MembersViewBody({super.key});

  final List<CardModel> cards = [
    CardModel(
      name: "mahmoud Ahmed Hassan",
      image: Assets.imagesMahmoud,
      subtitle: "Software Engineer",
    ),
    CardModel(
      name: "Abdelrahman Khaled Eid",
      image: Assets.imagesAbdo,
      subtitle: "Software Engineer",
    ),
    CardModel(name: 'Sohaila Ali Sayed'),
    CardModel(name: 'Mai Hossam Ali'),
    CardModel(name: 'Omar fawzi Abdullah'),
    CardModel(name: 'Isis Mohamed Ibrahim'),
    CardModel(name: 'Aya khaled Mosa'),
    CardModel(name: 'Nada Mohamed Elsisi'),
    CardModel(name: 'Aya Amgad Elsaid'),
    CardModel(name: 'Mohamed Hassanein Soliman'),
    CardModel(name: 'Esraa Abdelazeem Ahmed'),
    CardModel(name: 'Mona Sameh Ahmed'),
  ];

  @override
  State<MembersViewBody> createState() => _MembersViewBodyState();
}

class _MembersViewBodyState extends State<MembersViewBody>
    with TickerProviderStateMixin {
  late final int cardCount;
  final List<AnimationController> _controllers = [];
  final List<Animation<double>> _animations = [];

  @override
  void initState() {
    super.initState();
    cardCount = widget.cards.length;
    _startSequentialAnimations();
  }

  Future<void> _startSequentialAnimations() async {
    for (int i = 0; i < cardCount; i++) {
      final controller = AnimationController(
        duration: const Duration(milliseconds: 300),
        vsync: this,
      );
      final animation = CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      );

      _controllers.add(controller);
      _animations.add(animation);
      setState(() {}); // rebuild to show each card one by one

      await controller.forward();
      await Future.delayed(const Duration(milliseconds: 50));
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: widget.cards.length,
            itemBuilder: (context, index) {
              if (index >= _animations.length) {
                // fallback to empty if animation not ready
                return const SizedBox.shrink();
              }

              return MemberCardWidget(
                animation: _animations[index],
                cardModel: widget.cards[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
