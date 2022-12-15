import '../backend/api_requests/api_calls.dart';
import '../components/search_text_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({
    Key? key,
    this.searchQrCode,
    this.searchText,
  }) : super(key: key);

  final String? searchQrCode;
  final String? searchText;

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  TextEditingController? textController;
  var qr = '';
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(
        text: widget.searchQrCode == null || widget.searchQrCode == ''
            ? widget.searchText
            : widget.searchQrCode);
  }

  @override
  void dispose() {
    textController?.dispose();
    super.dispose();
  }

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
            padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                        child: InkWell(
                          onTap: () async {
                            context.pop();
                          },
                          child: Icon(
                            FFIcons.karrowLeft,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24,
                          ),
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
                            hintStyle:
                                FlutterFlowTheme.of(context).bodyText2.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 18,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.normal,
                                    ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context).lineColor,
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(24, 8, 8, 8),
                            suffixIcon: Icon(
                              FFIcons.ksearch,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 22,
                            ),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                        child: InkWell(
                          onTap: () async {
                            qr = await FlutterBarcodeScanner.scanBarcode(
                              '#C62828', // scanning line color
                              'Cancel', // cancel button text
                              true, // whether to show the flash icon
                              ScanMode.BARCODE,
                            );

                            setState(() {
                              FFAppState().QrCode = qr!;
                            });

                            context.pushNamed(
                              'Search',
                              queryParams: {
                                'searchQrCode': serializeParam(
                                  FFAppState().QrCode,
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );

                            setState(() {});
                          },
                          child: Icon(
                            FFIcons.kasset4,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (textController!.text == null || textController!.text == '')
                  Expanded(
                    child: SearchTextWidget(),
                  ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                      child: FutureBuilder<ApiCallResponse>(
                        future: NewBookCall.call(),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 40,
                                height: 40,
                                child: CircularProgressIndicator(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                            );
                          }
                          final gridViewNewBookResponse = snapshot.data!;
                          return Builder(
                            builder: (context) {
                              final results = NewBookCall.newbooks(
                                gridViewNewBookResponse.jsonBody,
                              ).toList();
                              return GridView.builder(
                                padding: EdgeInsets.zero,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16,
                                  childAspectRatio: 0.57,
                                ),
                                scrollDirection: Axis.vertical,
                                itemCount: results.length,
                                itemBuilder: (context, resultsIndex) {
                                  final resultsItem = results[resultsIndex];
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          onTap: () async {
                                            context.pushNamed(
                                              'BookDetail',
                                              queryParams: {
                                                'title1': serializeParam(
                                                  resultsIndex.toString(),
                                                  ParamType.String,
                                                ),
                                                'author1': serializeParam(
                                                  getJsonField(
                                                    resultsItem,
                                                    r'''$.price''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'releasedate1': serializeParam(
                                                  getJsonField(
                                                    resultsItem,
                                                    r'''$.releasedate''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'aboutbook1': serializeParam(
                                                  getJsonField(
                                                    resultsItem,
                                                    r'''$.aboutbook''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'image1': serializeParam(
                                                  getJsonField(
                                                    resultsItem,
                                                    r'''$.image''',
                                                  ),
                                                  ParamType.String,
                                                ),
                                                'aboutauthor1': serializeParam(
                                                  getJsonField(
                                                    resultsItem,
                                                    r'''$.aboutauthor''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'releaseday1': serializeParam(
                                                  getJsonField(
                                                    resultsItem,
                                                    r'''$.releaseday''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.network(
                                              getJsonField(
                                                resultsItem,
                                                r'''$.image''',
                                              ),
                                              width: double.infinity,
                                              height: 100,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 8, 0, 0),
                                        child: Text(
                                          getJsonField(
                                            resultsItem,
                                            r'''$.title''',
                                          ).toString(),
                                          maxLines: 2,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
