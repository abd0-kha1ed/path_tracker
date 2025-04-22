import 'package:flutter/material.dart';

class CardModel {
  final String name;
  final String? image;
  final String? subtitle;
  final Icons? icon;

  CardModel({required this.name, this.image, this.subtitle, this.icon});
}
