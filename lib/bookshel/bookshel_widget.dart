import '../backend/api_requests/api_calls.dart';
import '../components/book_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BookshelWidget extends StatefulWidget {
  const BookshelWidget({Key? key}) : super(key: key);

  @override
  _BookshelWidgetState createState() => _BookshelWidgetState();
}

class _BookshelWidgetState extends State<BookshelWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
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
                                'Đã đọc',
                                maxLines: 2,
                                style: FlutterFlowTheme.of(context).title1,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 4, 8, 4),
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
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
                                'Đang đọc',
                                maxLines: 2,
                                style: FlutterFlowTheme.of(context).title1,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 4, 8, 4),
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
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
                                'Muốn đọc',
                                maxLines: 2,
                                style: FlutterFlowTheme.of(context).title1,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 4, 8, 4),
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
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
            ],
          ),
        ),
      ),
    );
  }
}
