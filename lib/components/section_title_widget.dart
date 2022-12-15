import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SectionTitleWidget extends StatefulWidget {
  const SectionTitleWidget({
    Key? key,
    this.title,
  }) : super(key: key);

  final String? title;

  @override
  _SectionTitleWidgetState createState() => _SectionTitleWidgetState();
}

class _SectionTitleWidgetState extends State<SectionTitleWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SelectionArea(
            child: Text(
          widget.title!,
          style: FlutterFlowTheme.of(context).subtitle1,
        )),
        SelectionArea(
            child: Text(
          'see all ›',
          style: FlutterFlowTheme.of(context).subtitle2,
        )),
      ],
    );
  }
}
