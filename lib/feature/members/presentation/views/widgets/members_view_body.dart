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
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.cards.length,
            itemBuilder: (context, index) {
              if (index >= _animations.length) {
                return const SizedBox.shrink();
              }

              return MemberCardWidget(
                animation: _animations[index],
                cardModel: widget.cards[index],
              );
            },
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade50,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.person_pin,
                      color: Colors.blueGrey,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Supervisor: Dr. Khaled Youssef",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: Colors.blueGrey[800],
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
