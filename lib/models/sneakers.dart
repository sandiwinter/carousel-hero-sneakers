import 'package:flutter/material.dart';

class SneakerModel {
  final String brand;
  final String model;
  final String imageName;
  final double price;
  final Color bkgColor;

  SneakerModel(
    this.brand,
    this.model,
    this.imageName,
    this.price,
    this.bkgColor,
  );
}

List<SneakerModel> dataList = [
  SneakerModel("Nike", "Epic React", "assets/images/sneaker_01.png", 130.00,
      Color.fromRGBO(1, 149, 177, 100)),
  SneakerModel("Nike", "Air Max", "assets/images/sneaker_02.png", 130.00,
      Color.fromRGBO(83, 125, 207, 100)),
  SneakerModel("Nike", "Air 970", "assets/images/sneaker_03.png", 150.00,
      Color.fromRGBO(1, 217, 156, 132)),
  SneakerModel("Nike", "Epic React", "assets/images/sneaker_04.png", 130.00,
      Color.fromRGBO(83, 125, 207, 100)),
];
