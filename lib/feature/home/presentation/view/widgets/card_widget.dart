import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:robotics_app/feature/home/presentation/view/widgets/card_model.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.card, required this.connection});
  final CardModel card;
  final BluetoothConnection connection;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, card.routeName, arguments: connection);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(card.icon, size: 48, color: Colors.black),
            const SizedBox(height: 16),
            Text(card.title, style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
