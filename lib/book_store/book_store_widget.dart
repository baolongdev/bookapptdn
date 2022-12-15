import '../backend/api_requests/api_calls.dart';
import '../components/book_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BookStoreWidget extends StatefulWidget {
  const BookStoreWidget({Key? key}) : super(key: key);

  @override
  _BookStoreWidgetState createState() => _BookStoreWidgetState();
}

class _BookStoreWidgetState extends State<BookStoreWidget> {
  TextEditingController? textController;
  var qr = '';
  final scaffoldKey = GlobalKey<ScaffoldState>();

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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (FFAppState().Theme == false)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                        child: InkWell(
                          onTap: () async {
                            setState(() {
                              FFAppState().Theme = true;
                            });
                            setDarkModeSetting(context, ThemeMode.dark);
                          },
                          child: Icon(
                            FFIcons.klight2,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24,
                          ),
                        ),
                      ),
                    if (FFAppState().Theme == true)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                        child: InkWell(
                          onTap: () async {
                            setState(() {
                              FFAppState().Theme = false;
                            });
                            setDarkModeSetting(context, ThemeMode.light);
                          },
                          child: Icon(
                            FFIcons.klight,
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
                        onFieldSubmitted: (_) async {
                          context.pushNamed(
                            'Search',
                            queryParams: {
                              'searchQrCode': serializeParam(
                                qr,
                                ParamType.String,
                              ),
                              'searchText': serializeParam(
                                textController!.text,
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        },
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
                        style: FlutterFlowTheme.of(context).bodyText1.override(
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
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                      child: Icon(
                        FFIcons.knotificationRinging,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24,
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 24),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.65,
                                decoration: BoxDecoration(),
                                child: Text(
                                  'VH Việt Nam Trung đại',
                                  maxLines: 2,
                                  style: FlutterFlowTheme.of(context).title1,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 4, 8, 4),
                                  child: InkWell(
                                    onTap: () async {
                                      context.pushNamed(
                                        'ShowAllBooks',
                                        queryParams: {
                                          'title': serializeParam(
                                            'VH Việt Nam Trung đại',
                                            ParamType.String,
                                          ),
                                          'id': serializeParam(
                                            1,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Text(
                                      'Tất cả',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        FutureBuilder<ApiCallResponse>(
                          future: NewBookCall.call(),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: CircularProgressIndicator(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                  ),
                                ),
                              );
                            }
                            final rowNewBookResponse = snapshot.data!;
                            return Builder(
                              builder: (context) {
                                final newBooks = NewBookCall.newbooks(
                                  rowNewBookResponse.jsonBody,
                                ).toList().take(10).toList();
                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(newBooks.length,
                                        (newBooksIndex) {
                                      final newBooksItem =
                                          newBooks[newBooksIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 16, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            context.pushNamed(
                                              'BookDetail',
                                              queryParams: {
                                                'title1': serializeParam(
                                                  getJsonField(
                                                    newBooksItem,
                                                    r'''$.title''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'author1': serializeParam(
                                                  getJsonField(
                                                    newBooksItem,
                                                    r'''$.author''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'releasedate1': serializeParam(
                                                  getJsonField(
                                                    newBooksItem,
                                                    r'''$.releasedate''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'aboutbook1': serializeParam(
                                                  getJsonField(
                                                    newBooksItem,
                                                    r'''$.aboutbook''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'image1': serializeParam(
                                                  getJsonField(
                                                    newBooksItem,
                                                    r'''$.image''',
                                                  ),
                                                  ParamType.String,
                                                ),
                                                'aboutauthor1': serializeParam(
                                                  getJsonField(
                                                    newBooksItem,
                                                    r'''$.aboutauthor''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'releaseday1': serializeParam(
                                                  getJsonField(
                                                    newBooksItem,
                                                    r'''$.releaseday''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'bookMark': serializeParam(
                                                  true,
                                                  ParamType.bool,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: BookWidget(
                                            key: Key('Book_${newBooksIndex}'),
                                            image: getJsonField(
                                              newBooksItem,
                                              r'''$.image''',
                                            ),
                                            nameBook: getJsonField(
                                              newBooksItem,
                                              r'''$.title''',
                                            ).toString(),
                                            author: valueOrDefault<String>(
                                              getJsonField(
                                                newBooksItem,
                                                r'''$.price''',
                                              ).toString(),
                                              '.price',
                                            ),
                                            width: 150,
                                            sizeText: 18,
                                            sizeTextSmall: 14,
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 24),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.65,
                                decoration: BoxDecoration(),
                                child: Text(
                                  'VH Việt Nam Hiện đại',
                                  maxLines: 2,
                                  style: FlutterFlowTheme.of(context).title1,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 4, 8, 4),
                                  child: InkWell(
                                    onTap: () async {
                                      context.pushNamed(
                                        'ShowAllBooks',
                                        queryParams: {
                                          'title': serializeParam(
                                            'VH Việt Nam Hiện đại',
                                            ParamType.String,
                                          ),
                                          'id': serializeParam(
                                            2,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Text(
                                      'Tất cả',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        FutureBuilder<ApiCallResponse>(
                          future: NewBookCall.call(),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: CircularProgressIndicator(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                  ),
                                ),
                              );
                            }
                            final rowNewBookResponse = snapshot.data!;
                            return Builder(
                              builder: (context) {
                                final newBooks = NewBookCall.newbooks(
                                  rowNewBookResponse.jsonBody,
                                ).toList().take(10).toList();
                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(newBooks.length,
                                        (newBooksIndex) {
                                      final newBooksItem =
                                          newBooks[newBooksIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 16, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            context.pushNamed(
                                              'BookDetail',
                                              queryParams: {
                                                'title1': serializeParam(
                                                  getJsonField(
                                                    newBooksItem,
                                                    r'''$.title''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'author1': serializeParam(
                                                  getJsonField(
                                                    newBooksItem,
                                                    r'''$.author''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'releasedate1': serializeParam(
                                                  getJsonField(
                                                    newBooksItem,
                                                    r'''$.releasedate''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'aboutbook1': serializeParam(
                                                  getJsonField(
                                                    newBooksItem,
                                                    r'''$.aboutbook''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'image1': serializeParam(
                                                  getJsonField(
                                                    newBooksItem,
                                                    r'''$.image''',
                                                  ),
                                                  ParamType.String,
                                                ),
                                                'aboutauthor1': serializeParam(
                                                  getJsonField(
                                                    newBooksItem,
                                                    r'''$.aboutauthor''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'releaseday1': serializeParam(
                                                  getJsonField(
                                                    newBooksItem,
                                                    r'''$.releaseday''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: BookWidget(
                                            key: Key('Book_${newBooksIndex}'),
                                            image: getJsonField(
                                              newBooksItem,
                                              r'''$.image''',
                                            ),
                                            nameBook: getJsonField(
                                              newBooksItem,
                                              r'''$.title''',
                                            ).toString(),
                                            author: getJsonField(
                                              newBooksItem,
                                              r'''$.price''',
                                            ).toString(),
                                            width: 150,
                                            sizeText: 18,
                                            sizeTextSmall: 14,
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
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
