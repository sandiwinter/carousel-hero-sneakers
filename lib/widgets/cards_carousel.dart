import 'dart:math';

import 'package:flutter/material.dart';

import '../models/sneakers.dart';
import '../screens/details.dart';

class CardsCarousel extends StatefulWidget {
  @override
  State<CardsCarousel> createState() => _CardsCarouselState();
}

class _CardsCarouselState extends State<CardsCarousel> {
  late PageController _pageController;

  int _currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController =
        PageController(initialPage: _currentPage, viewportFraction: 0.8);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RotatedBox(
                quarterTurns: -1,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Upcoming",
                    style: const TextStyle(
                        fontFamily: 'Noto',
                        fontSize: 14,
                        color: Colors.black26,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              RotatedBox(
                quarterTurns: -1,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Featured",
                    style: const TextStyle(
                        fontFamily: 'Noto',
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              RotatedBox(
                quarterTurns: -1,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "New",
                    style: const TextStyle(
                        fontFamily: 'Noto',
                        fontSize: 14,
                        color: Colors.black26,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        AspectRatio(
          aspectRatio: 1.05,
          child: PageView.builder(
              itemCount: dataList.length,
              physics: const ClampingScrollPhysics(),
              controller: _pageController,
              itemBuilder: (context, index) {
                return carouselView(index);
              }),
        )
      ],
    );
  }

  double viewportFraction = 0.8;

  double? pageOffset = 0;

  Widget carouselView(int index) {
    // index - current card index which we transforming
    return Hero(
      tag: dataList[index].imageName,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailsScreen(data: dataList[index])));
        },
        child: Stack(children: [
          AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              double value = 0.0;
              if (_pageController.position.haveDimensions) {
                value = (index.toDouble() - (_pageController.page ?? 0));

                if (value >= 0.5) {
                  value = (value - 1) * -1;
                } else if (value >= 0) {
                } else if (value >= -0.5) {
                } else {}

                if (index == 1)
                  print("page " +
                      (_pageController.page)!.toStringAsFixed(3) +
                      " index $index value " +
                      value.toStringAsFixed(3));

                value = value * 0.3;
              }

              return Transform(
                transform: Matrix4.identity()
                  ..setEntry(
                    3,
                    2,
                    0.001,
                  )
                  ..rotateY(pi * value),
                alignment: Alignment.center,
                child: carouselCardBkg(dataList[index]),
              );
            },
          ),
          Positioned(
            right: 0,
            top: 40,
            child: AnimatedBuilder(
              animation: _pageController,
              builder: (context, child) {
                double value = 0.0;
                double valueTranslate = 0.0;
                if (_pageController.position.haveDimensions) {
                  value = index.toDouble() - (_pageController.page ?? 0);
                  value = (value * 0.4).clamp(0, 1);
                  value = value;

                  valueTranslate =
                      index.toDouble() - (_pageController.page ?? 0);

                  valueTranslate = (valueTranslate * 300);
                }

                return Transform(
                  transform: Matrix4.identity()
                    ..setEntry(
                      3,
                      2,
                      0.001,
                    )
                    ..translate(valueTranslate)
                    ..rotateZ(-pi * value),
                  alignment: Alignment.center,
                  child: carouselCardFront(dataList[index]),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }

  Widget carouselCardFront(SneakerModel data) {
    return Container(
      width: 230,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
            image: AssetImage(
              data.imageName,
            ),
            fit: BoxFit.fill),
      ),
    );
  }

  Widget carouselCardBkg(SneakerModel data) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: data.bkgColor,
                borderRadius: BorderRadius.circular(30),
                /*
                      image: DecorationImage(
                          image: AssetImage(
                            data.imageName,
                          ),
                          fit: BoxFit.fill),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 4,
                            color: Colors.black26)
                      ]*/
                boxShadow: [
                  BoxShadow(
                    color: data.bkgColor,
                  ),
                  BoxShadow(
                    color: data.bkgColor.withOpacity(0.9),
                    spreadRadius: -10.0,
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Stack(children: [
                Positioned(
                  right: 20,
                  top: 20,
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  right: 20,
                  bottom: 20,
                  child: Icon(
                    Icons.trending_flat,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: Text(
                          data.brand.toUpperCase(),
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontFamily: 'Noto',
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: Text(
                          data.model.toUpperCase(),
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontFamily: 'Noto',
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Text(
                          "\$${data.price.toStringAsFixed(2)}",
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontFamily: 'Noto',
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.normal),
                        ),
                      )
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      ],
    );
  }
}
