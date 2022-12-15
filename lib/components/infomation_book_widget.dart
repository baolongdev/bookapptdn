import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InfomationBookWidget extends StatefulWidget {
  const InfomationBookWidget({
    Key? key,
    this.content,
    this.title,
  }) : super(key: key);

  final String? content;
  final String? title;

  @override
  _InfomationBookWidgetState createState() => _InfomationBookWidgetState();
}

class _InfomationBookWidgetState extends State<InfomationBookWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(),
                  child: Text(
                    'Giới thiệu về  ${widget.title}',
                    maxLines: 2,
                    style: FlutterFlowTheme.of(context).title3.override(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                Icon(
                  FFIcons.karrowRight,
                  color: FlutterFlowTheme.of(context).primaryColor,
                  size: 32,
                ),
              ],
            ),
            Container(
              width: 300,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                child: Text(
                  widget.content!,
                  textAlign: TextAlign.start,
                  maxLines: 4,
                  style: FlutterFlowTheme.of(context).bodyText2.override(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                        lineHeight: 2,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
