import 'package:flutter/material.dart';
import 'package:robotics_app/feature/camera/presentation/views/camera_view.dart';
import 'package:robotics_app/feature/control/presentation/views/control_view.dart';
import 'package:robotics_app/feature/data/presentation/views/data_view.dart';
import 'package:robotics_app/feature/home/presentation/view/widgets/card_model.dart';
import 'package:robotics_app/feature/home/presentation/view/widgets/card_widget.dart';
import 'package:robotics_app/feature/members/presentation/views/members_veiw.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeViewBodyState createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody>
    with SingleTickerProviderStateMixin {
  final List<CardModel> cards = [
    CardModel(
        title: 'Control',
        icon: Icons.gamepad,
        routeName: ControlView.routeName),
    CardModel(
        title: 'Data', icon: Icons.bar_chart, routeName: DataView.routeName),
    CardModel(
        title: 'Members', icon: Icons.group, routeName: MembersView.routeName),
    CardModel(
        title: 'Camera',
        icon: Icons.camera_alt,
        routeName: CameraView.routeName),
  ];

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward(); // Start the animation
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: cards.length,
      itemBuilder: (context, index) {
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return ScaleTransition(
              scale: _scaleAnimation,
              child: CardWidget(card: cards[index]),
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
