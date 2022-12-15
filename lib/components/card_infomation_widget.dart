import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CardInfomationWidget extends StatefulWidget {
  const CardInfomationWidget({
    Key? key,
    this.title,
    this.information,
  }) : super(key: key);

  final String? title;
  final String? information;

  @override
  _CardInfomationWidgetState createState() => _CardInfomationWidgetState();
}

class _CardInfomationWidgetState extends State<CardInfomationWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0x00FFFFFF),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title!,
              style: FlutterFlowTheme.of(context).subtitle1,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
              child: Text(
                widget.information!,
                style: FlutterFlowTheme.of(context).bodyText2.override(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
