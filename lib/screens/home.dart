import 'dart:math';

import 'package:carousel_hero/models/sneakers.dart';
import 'package:carousel_hero/screens/details.dart';
import 'package:flutter/material.dart';

import '../widgets/brands_section.dart';
import '../widgets/cards_carousel.dart';
import '../widgets/home_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: <Widget>[
            HomeAppBar(),
            BrandsSection(
                brands: ['Nike', 'Adidas', 'Jordan', 'Puma', 'Rebook']),
            CardsCarousel(),
          ],
        ),
      ),
    );
  }
}
