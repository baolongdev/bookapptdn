import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/book_big_card_widget.dart';
import '../components/book_widget.dart';
import '../components/infomation_book_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:styled_divider/styled_divider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BookDetailWidget extends StatefulWidget {
  const BookDetailWidget({
    Key? key,
    this.title1,
    this.author1,
    this.releasedate1,
    this.aboutbook1,
    this.image1,
    this.aboutauthor1,
    this.releaseday1,
    this.bookMark,
  }) : super(key: key);

  final String? title1;
  final String? author1;
  final String? releasedate1;
  final String? aboutbook1;
  final String? image1;
  final String? aboutauthor1;
  final String? releaseday1;
  final bool? bookMark;

  @override
  _BookDetailWidgetState createState() => _BookDetailWidgetState();
}

class _BookDetailWidgetState extends State<BookDetailWidget> {
  double? ratingBarValue;
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
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
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
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                        ),
                      ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        buttonSize: 50,
                        icon: Icon(
                          FFIcons.ksearch,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24,
                        ),
                        onPressed: () async {
                          context.pushNamed('Search');
                        },
                      ),
                      if (widget.bookMark == false)
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 24,
                          buttonSize: 50,
                          icon: FaIcon(
                            FontAwesomeIcons.solidBookmark,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 22,
                          ),
                          onPressed: () async {
                            final archiverCreateData = createArchiverRecordData(
                              archiveRead: createArchiveReadStruct(
                                fieldValues: {
                                  'id': [widget.title1],
                                },
                                clearUnsetFields: false,
                                create: true,
                              ),
                            );
                            await ArchiverRecord.collection
                                .doc()
                                .set(archiverCreateData);
                          },
                        ),
                      if (widget.bookMark == true)
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 24,
                          buttonSize: 50,
                          icon: Icon(
                            FFIcons.kbookmark,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24,
                          ),
                          onPressed: () async {
                            final archiverCreateData = createArchiverRecordData(
                              archiveRead: createArchiveReadStruct(
                                fieldValues: {
                                  'id': [widget.title1],
                                },
                                clearUnsetFields: false,
                                create: true,
                              ),
                            );
                            await ArchiverRecord.collection
                                .doc()
                                .set(archiverCreateData);
                          },
                        ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 24,
                        buttonSize: 50,
                        icon: Icon(
                          FFIcons.kmoreVertical,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 24),
                    child: BookBigCardWidget(
                      image: widget.image1,
                      nameBook: widget.title1,
                      author: widget.author1,
                      releasedate: widget.releasedate1,
                    ),
                  ),
                  Divider(
                    height: 5,
                    thickness: 1,
                    color: FlutterFlowTheme.of(context).secondaryText,
                  ),
                  InkWell(
                    onTap: () async {
                      context.pushNamed(
                        'informationBookShow',
                        queryParams: {
                          'nameBook': serializeParam(
                            widget.title1,
                            ParamType.String,
                          ),
                          'content': serializeParam(
                            widget.aboutbook1,
                            ParamType.String,
                          ),
                          'language': serializeParam(
                            widget.title1,
                            ParamType.String,
                          ),
                          'author': serializeParam(
                            widget.author1,
                            ParamType.String,
                          ),
                          'category': serializeParam(
                            widget.releaseday1,
                            ParamType.String,
                          ),
                        }.withoutNulls,
                      );
                    },
                    child: InfomationBookWidget(
                      content: widget.aboutbook1,
                      title: widget.title1,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      context.pushNamed('informationAuthor');
                    },
                    child: InfomationBookWidget(
                      content: widget.aboutauthor1,
                      title: widget.author1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 24),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                child: Text(
                                  'Sách khác của ${widget.author1}',
                                  maxLines: 2,
                                  style: FlutterFlowTheme.of(context)
                                      .title3
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                              Icon(
                                FFIcons.karrowRight,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                size: 32,
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
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
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                    ),
                                  );
                                }
                                final rowNewBookResponse = snapshot.data!;
                                return Builder(
                                  builder: (context) {
                                    final bookAuthor = NewBookCall.newbooks(
                                      rowNewBookResponse.jsonBody,
                                    ).toList();
                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children:
                                            List.generate(bookAuthor.length,
                                                (bookAuthorIndex) {
                                          final bookAuthorItem =
                                              bookAuthor[bookAuthorIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 16, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                context.pushNamed(
                                                  'BookDetail',
                                                  queryParams: {
                                                    'title1': serializeParam(
                                                      getJsonField(
                                                        bookAuthorItem,
                                                        r'''$.title''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                    'author1': serializeParam(
                                                      getJsonField(
                                                        bookAuthorItem,
                                                        r'''$.author''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                    'releasedate1':
                                                        serializeParam(
                                                      getJsonField(
                                                        bookAuthorItem,
                                                        r'''$.releasedate''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                    'aboutbook1':
                                                        serializeParam(
                                                      getJsonField(
                                                        bookAuthorItem,
                                                        r'''$.aboutbook''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                    'image1': serializeParam(
                                                      getJsonField(
                                                        bookAuthorItem,
                                                        r'''$.image''',
                                                      ),
                                                      ParamType.String,
                                                    ),
                                                    'aboutauthor1':
                                                        serializeParam(
                                                      getJsonField(
                                                        bookAuthorItem,
                                                        r'''$.aboutauthor''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                    'releaseday1':
                                                        serializeParam(
                                                      getJsonField(
                                                        bookAuthorItem,
                                                        r'''$.releaseday''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: BookWidget(
                                                key: Key(
                                                    'Book_${bookAuthorIndex}'),
                                                image: getJsonField(
                                                  bookAuthorItem,
                                                  r'''$.image''',
                                                ),
                                                nameBook: getJsonField(
                                                  bookAuthorItem,
                                                  r'''$.title''',
                                                ).toString(),
                                                author: getJsonField(
                                                  bookAuthorItem,
                                                  r'''$.author''',
                                                ).toString(),
                                                width: 120,
                                                sizeText: 16,
                                                sizeTextSmall: 12,
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
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    height: 5,
                    thickness: 1,
                    color: FlutterFlowTheme.of(context).secondaryText,
                  ),
                  Padding(
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
                          Text(
                            'Xếp hạng sách',
                            style: FlutterFlowTheme.of(context).title1,
                          ),
                          Text(
                            'Cho mọi người biết ý kiến của bạn',
                            style:
                                FlutterFlowTheme.of(context).bodyText2.override(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                              child: RatingBar.builder(
                                onRatingUpdate: (newValue) {
                                  setState(() => ratingBarValue = newValue);
                                  if (Navigator.of(context).canPop()) {
                                    context.pop();
                                  }
                                  context.pushNamed(
                                    'CardEvaluate',
                                    queryParams: {
                                      'rating': serializeParam(
                                        ratingBarValue?.round(),
                                        ParamType.int,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                itemBuilder: (context, index) => Icon(
                                  Icons.star_rounded,
                                  color: Color(0xFFFFE15D),
                                ),
                                direction: Axis.horizontal,
                                initialRating: ratingBarValue ??= 0,
                                unratedColor: Color(0xFF9E9E9E),
                                itemCount: 5,
                                itemSize: 40,
                                glowColor: Color(0xFFFFE15D),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 12, 0, 24),
                              child: InkWell(
                                onTap: () async {
                                  context.pushNamed(
                                    'CardEvaluate',
                                    queryParams: {
                                      'rating': serializeParam(
                                        0,
                                        ParamType.int,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 12, 12, 12),
                                    child: Text(
                                      'Viết bài đánh giá',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
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
      ),
    );
  }
}
