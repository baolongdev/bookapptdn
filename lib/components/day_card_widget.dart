import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DayCardWidget extends StatefulWidget {
  const DayCardWidget({
    Key? key,
    this.day,
    this.dayoftheweek,
    this.active,
  }) : super(key: key);

  final String? day;
  final String? dayoftheweek;
  final bool? active;

  @override
  _DayCardWidgetState createState() => _DayCardWidgetState();
}

class _DayCardWidgetState extends State<DayCardWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 24, 0),
      child: Container(
        width: 80,
        decoration: BoxDecoration(
          color: valueOrDefault<Color>(
            widget.active == true
                ? FlutterFlowTheme.of(context).primaryColor
                : FlutterFlowTheme.of(context).secondaryBackground,
            FlutterFlowTheme.of(context).secondaryBackground,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8, 12, 8, 12),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 14),
                child: Text(
                  widget.dayoftheweek!,
                  style: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Poppins',
                        color: widget.active == false
                            ? FlutterFlowTheme.of(context).primaryText
                            : FlutterFlowTheme.of(context).primaryBtnText,
                      ),
                ),
              ),
              Text(
                widget.day!,
                style: FlutterFlowTheme.of(context).title1.override(
                      fontFamily: 'Poppins',
                      color: widget.active == false
                          ? FlutterFlowTheme.of(context).primaryText
                          : FlutterFlowTheme.of(context).primaryBtnText,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
