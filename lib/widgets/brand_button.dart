import 'package:flutter/material.dart';

class BrandButton extends StatelessWidget {
  final String title;
  final bool isAlt;

  const BrandButton({
    required this.title,
    required this.isAlt,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 10),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            //color: FlutterFlowTheme.of(context).primaryColor,

            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: Colors.transparent,
                offset: Offset(0, 6),
              )
            ],
/*
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.blue.shade800,
              width: 3,
            ),
*/
            color: isAlt ? Colors.white : Colors.white,
          ),
          alignment: AlignmentDirectional(0, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
            child: Text(
              title,
              style: TextStyle(
                  color: isAlt ? Colors.black : Colors.black26,
                  fontFamily: 'Noto',
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
/*
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Brazila',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 17,
                                    useGoogleFonts: false,
                                  ),
                                  */
            ),
          ),
        ),
      ),
    );
  }
}
