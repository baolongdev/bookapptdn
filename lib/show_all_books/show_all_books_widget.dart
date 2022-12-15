import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ShowAllBooksWidget extends StatefulWidget {
  const ShowAllBooksWidget({
    Key? key,
    this.title,
    this.id,
  }) : super(key: key);

  final String? title;
  final int? id;

  @override
  _ShowAllBooksWidgetState createState() => _ShowAllBooksWidgetState();
}

class _ShowAllBooksWidgetState extends State<ShowAllBooksWidget> {
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
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 2, 0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 60,
                            icon: Icon(
                              FFIcons.karrowLeft,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 30,
                            ),
                            onPressed: () async {
                              context.pop();
                            },
                          ),
                        ),
                        Text(
                          widget.title!,
                          style: FlutterFlowTheme.of(context).title3.override(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
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
                            final books = NewBookCall.newbooks(
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
                              itemCount: books.length,
                              itemBuilder: (context, booksIndex) {
                                final booksItem = books[booksIndex];
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
                                                booksIndex.toString(),
                                                ParamType.String,
                                              ),
                                              'author1': serializeParam(
                                                getJsonField(
                                                  booksItem,
                                                  r'''$.price''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                              'releasedate1': serializeParam(
                                                getJsonField(
                                                  booksItem,
                                                  r'''$.releasedate''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                              'aboutbook1': serializeParam(
                                                getJsonField(
                                                  booksItem,
                                                  r'''$.aboutbook''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                              'image1': serializeParam(
                                                getJsonField(
                                                  booksItem,
                                                  r'''$.image''',
                                                ),
                                                ParamType.String,
                                              ),
                                              'aboutauthor1': serializeParam(
                                                getJsonField(
                                                  booksItem,
                                                  r'''$.aboutauthor''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                              'releaseday1': serializeParam(
                                                getJsonField(
                                                  booksItem,
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
                                              booksItem,
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
                                          booksItem,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
