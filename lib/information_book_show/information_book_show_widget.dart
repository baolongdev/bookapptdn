import '../components/card_infomation_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InformationBookShowWidget extends StatefulWidget {
  const InformationBookShowWidget({
    Key? key,
    this.nameBook,
    this.content,
    this.language,
    this.author,
    this.category,
  }) : super(key: key);

  final String? nameBook;
  final String? content;
  final String? language;
  final String? author;
  final String? category;

  @override
  _InformationBookShowWidgetState createState() =>
      _InformationBookShowWidgetState();
}

class _InformationBookShowWidgetState extends State<InformationBookShowWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 24,
                    buttonSize: 50,
                    icon: Icon(
                      FFIcons.karrowLeft,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 30,
                    ),
                    onPressed: () async {
                      context.pop();
                    },
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Giới thiệu về sách ${widget.nameBook}',
                          style: FlutterFlowTheme.of(context).title1,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 64),
                          child: Text(
                            widget.content!,
                            style:
                                FlutterFlowTheme.of(context).bodyText2.override(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 10,
                    thickness: 2,
                    color: FlutterFlowTheme.of(context).secondaryText,
                  ),
                  CardInfomationWidget(
                    title: 'Ngôn ngữ',
                    information: widget.nameBook,
                  ),
                  CardInfomationWidget(
                    title: 'Tác giả',
                    information: widget.author,
                  ),
                  CardInfomationWidget(
                    title: 'Thể loại',
                    information: widget.category,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
