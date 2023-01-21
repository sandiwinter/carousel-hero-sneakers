import 'package:carousel_hero/models/sneakers.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final SneakerModel data;
  const DetailsScreen({Key? key, required this.data}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Hero(
              tag: widget.data.imageName,
              child: Stack(
                children: [
                  Positioned(
                    top: -170,
                    left: -10,
                    child: Container(
                      height: 550,
                      width: 550,
                      decoration: BoxDecoration(
                        color: widget.data.bkgColor,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: widget.data.bkgColor,
                          ),
                          BoxShadow(
                            color: widget.data.bkgColor.withOpacity(0.9),
                            spreadRadius: -10.0,
                            blurRadius: 10.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(20.0, 40, 20, 0),
                        child: Row(
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: () {
                                print('clicked');
                                Navigator.of(context).pop();
                              },
                              child: Icon(
                                Icons.keyboard_backspace,
                                color: Colors.white,
                              ),
                              style: ButtonStyle(
                                  shape:
                                      MaterialStateProperty.all(CircleBorder()),
                                  padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                          EdgeInsets.all(10)),
                                  shadowColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.transparent)),
                            ),
                            Spacer(),
                            Text(
                              widget.data.brand,
                              style: TextStyle(
                                  fontFamily: 'Noto',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 24),
                            ),
                            Spacer(),
                            ElevatedButton(
                              onPressed: () {},
                              child: Icon(Icons.favorite_border,
                                  color: Colors.white),
                              style: ButtonStyle(
                                  shape:
                                      MaterialStateProperty.all(CircleBorder()),
                                  padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                          EdgeInsets.all(10)),
                                  backgroundColor: MaterialStateProperty.all(
                                      widget.data.bkgColor.withOpacity(0.7))),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: Container(
                          height: 350,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            image: DecorationImage(
                                image: AssetImage(
                                  widget.data.imageName,
                                ),
                                fit: BoxFit.fill),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Container(
              padding: EdgeInsets.only(
                top: 15,
              ),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.black12,
                    width: 2.0,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      widget.data.model,
                      style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      "\$${widget.data.price.toStringAsFixed(2)}",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
