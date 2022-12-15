import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CardTimeWidget extends StatefulWidget {
  const CardTimeWidget({
    Key? key,
    this.icon,
    this.time,
    this.title,
  }) : super(key: key);

  final Widget? icon;
  final int? time;
  final String? title;

  @override
  _CardTimeWidgetState createState() => _CardTimeWidgetState();
}

class _CardTimeWidgetState extends State<CardTimeWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
              child: widget.icon!,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
              child: Text(
                widget.time.toString(),
                style: FlutterFlowTheme.of(context).title3.override(
                      fontFamily: 'Poppins',
                      fontSize: 24,
                    ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(),
              child: Text(
                widget.title!,
                style: FlutterFlowTheme.of(context).bodyText2.override(
                      fontFamily: 'Poppins',
                      fontSize: 12,
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
