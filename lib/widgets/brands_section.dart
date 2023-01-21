import 'package:flutter/material.dart';
import 'brand_button.dart';

class BrandsSection extends StatefulWidget {
  final List<String> brands;

  const BrandsSection({
    required this.brands,
  });

  @override
  State<BrandsSection> createState() => _BrandsSection();
}

class _BrandsSection extends State<BrandsSection> {
/*
  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Locations>(context, listen: false)
          .fetchLocations('level=0')
          .then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }*/

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ...widget.brands.map((brand) {
                    return BrandButton(
                      title: brand,
                      isAlt: brand == 'Nike',
                    );
                  }).toList()
                ],
              ),
            ),
          ],
        ),
      ), //.animateOnPageLoad(animationsMap['rowOnPageLoadAnimation3']!),
    );
  }
}
