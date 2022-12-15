import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../components/profile_card_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  bool isMediaUploading = false;
  String uploadedFileUrl = '';

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            FFIcons.karrowLeft,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            print('IconButton pressed ...');
          },
        ),
        title: Text(
          'Profile',
          style: FlutterFlowTheme.of(context).title3,
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(24, 16, 24, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AuthUserStreamWidget(
                    child: InkWell(
                      onTap: () async {
                        final selectedMedia =
                            await selectMediaWithSourceBottomSheet(
                          context: context,
                          maxWidth: 256.00,
                          maxHeight: 256.00,
                          allowPhoto: true,
                        );
                        if (selectedMedia != null &&
                            selectedMedia.every((m) =>
                                validateFileFormat(m.storagePath, context))) {
                          setState(() => isMediaUploading = true);
                          var downloadUrls = <String>[];
                          try {
                            downloadUrls = (await Future.wait(
                              selectedMedia.map(
                                (m) async =>
                                    await uploadData(m.storagePath, m.bytes),
                              ),
                            ))
                                .where((u) => u != null)
                                .map((u) => u!)
                                .toList();
                          } finally {
                            isMediaUploading = false;
                          }
                          if (downloadUrls.length == selectedMedia.length) {
                            setState(
                                () => uploadedFileUrl = downloadUrls.first);
                          } else {
                            setState(() {});
                            return;
                          }
                        }

                        final userUpdateData = createUserRecordData(
                          photoUrl: uploadedFileUrl,
                          displayName: 'hello',
                        );
                        await currentUserReference!.update(userUpdateData);
                        setState(() {
                          FFAppState().avatar = uploadedFileUrl;
                        });
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          uploadedFileUrl == null || uploadedFileUrl == ''
                              ? currentUserPhoto
                              : uploadedFileUrl,
                          width: 64,
                          height: 64,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AuthUserStreamWidget(
                            child: Text(
                              currentUserDisplayName,
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                          Text(
                            '@long',
                            style: FlutterFlowTheme.of(context).bodyText2,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFFED049),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 4, 8, 4),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 4, 0),
                                      child: Icon(
                                        FFIcons.kdiamond,
                                        color: Colors.black,
                                        size: 14,
                                      ),
                                    ),
                                    Text(
                                      'Premium ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ],
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 36, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ProfileCardWidget(
                      icon: Icon(
                        FFIcons.kuser,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 16,
                      ),
                      title: 'Thông tin của tôi',
                      trilingText: ' ',
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: ProfileCardWidget(
                        icon: Icon(
                          FFIcons.ksetting2,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 16,
                        ),
                        title: 'Cài đặt',
                        trilingText: ' ',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: ProfileCardWidget(
                        icon: Icon(
                          FFIcons.knotification,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 16,
                        ),
                        title: 'Thông báo',
                        trilingText: '12',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: ProfileCardWidget(
                        icon: Icon(
                          FFIcons.kmoney,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 16,
                        ),
                        title: 'Lịch sử giao dịch',
                        trilingText: ' ',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: ProfileCardWidget(
                        icon: Icon(
                          FFIcons.kflag,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 16,
                        ),
                        title: 'FAQ ',
                        trilingText: ' ',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: ProfileCardWidget(
                        icon: Icon(
                          FFIcons.kinfo,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 16,
                        ),
                        title: 'Giới thiệu về ứng dụng',
                        trilingText: ' ',
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            GoRouter.of(context).prepareAuthEvent();
                            await signOut();

                            context.goNamedAuth('Onboardin', mounted);
                          },
                          child: ProfileCardWidget(
                            icon: Icon(
                              FFIcons.ksingOut,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 16,
                            ),
                            title: 'Đăng xuất',
                            trilingText: ' ',
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
    );
  }
}
