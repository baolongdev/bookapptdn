import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchCardWidget extends StatefulWidget {
  const SearchCardWidget({Key? key}) : super(key: key);

  @override
  _SearchCardWidgetState createState() => _SearchCardWidgetState();
}

class _SearchCardWidgetState extends State<SearchCardWidget> {
  TextEditingController? textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
          child: Icon(
            FFIcons.ktextAlignLeft,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 24,
          ),
        ),
        Expanded(
          child: TextFormField(
            controller: textController,
            onChanged: (_) => EasyDebounce.debounce(
              'textController',
              Duration(milliseconds: 200),
              () => setState(() {}),
            ),
            autofocus: true,
            obscureText: false,
            decoration: InputDecoration(
              hintStyle: FlutterFlowTheme.of(context).bodyText2.override(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    letterSpacing: 1,
                    fontWeight: FontWeight.normal,
                  ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x00000000),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x00000000),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x00000000),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x00000000),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              filled: true,
              fillColor: FlutterFlowTheme.of(context).lineColor,
              contentPadding: EdgeInsetsDirectional.fromSTEB(24, 8, 8, 8),
              suffixIcon: Icon(
                FFIcons.ksearch,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 22,
              ),
            ),
            style: FlutterFlowTheme.of(context).bodyText1.override(
                  fontFamily: 'Poppins',
                  letterSpacing: 1,
                  fontWeight: FontWeight.normal,
                ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
          child: Icon(
            FFIcons.kasset4,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 18,
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
          child: Icon(
            FFIcons.knotificationRinging,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 24,
          ),
        ),
      ],
    );
  }
}
