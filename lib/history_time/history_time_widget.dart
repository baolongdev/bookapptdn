import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_timer.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class HistoryTimeWidget extends StatefulWidget {
  const HistoryTimeWidget({Key? key}) : super(key: key);

  @override
  _HistoryTimeWidgetState createState() => _HistoryTimeWidgetState();
}

class _HistoryTimeWidgetState extends State<HistoryTimeWidget> {
  StopWatchTimer? timerController;
  String? timerValue;
  int? timerMilliseconds;
  int? dropDownValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    timerController?.dispose();
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
            padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        onTap: () async {
                          context.pop();
                        },
                        child: Icon(
                          FFIcons.karrowLeft,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 32,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Thời gian',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                              ),
                              FlutterFlowTimer(
                                timerValue: timerValue ??=
                                    StopWatchTimer.getDisplayTime(
                                  timerMilliseconds ??= 10000,
                                  hours: true,
                                  minute: true,
                                  second: true,
                                  milliSecond: false,
                                ),
                                timer: timerController ??= StopWatchTimer(
                                  mode: StopWatchMode.countDown,
                                  presetMillisecond: timerMilliseconds ??=
                                      10000,
                                  onChange: (value) {
                                    setState(() {
                                      timerMilliseconds = value;
                                      timerValue =
                                          StopWatchTimer.getDisplayTime(
                                        value,
                                        hours: true,
                                        minute: true,
                                        second: true,
                                        milliSecond: false,
                                      );
                                    });
                                  },
                                ),
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .title1
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 42,
                                    ),
                                onEnded: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(),
                        child: Stack(
                          alignment: AlignmentDirectional(0, 0),
                          children: [
                            CircularPercentIndicator(
                              percent: 0,
                              radius: MediaQuery.of(context).size.width * 0.25,
                              lineWidth: 30,
                              animation: true,
                              progressColor: Color(0x00000000),
                              backgroundColor: Color(0x2D95A1AC),
                            ),
                            CircularPercentIndicator(
                              percent: 0.5,
                              radius: MediaQuery.of(context).size.width * 0.275,
                              lineWidth: 60,
                              animation: true,
                              progressColor:
                                  FlutterFlowTheme.of(context).primaryColor,
                              backgroundColor: Color(0x00E60B09),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FlutterFlowDropDown<int>(
                                initialOption: dropDownValue ??=
                                    FFAppState().getTime,
                                options: [
                                  300000,
                                  600000,
                                  1800000,
                                  2700000,
                                  3600000,
                                  7200000
                                ],
                                optionLabels: [
                                  '5 phút',
                                  '10 phút',
                                  '30 phút',
                                  '45 phút',
                                  '1 giờ',
                                  '2 giờ'
                                ],
                                onChanged: (val) =>
                                    setState(() => dropDownValue = val),
                                width: 180,
                                height: 50,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 12,
                                    ),
                                hintText: 'Chọn thời gian đọc',
                                icon: Icon(
                                  FFIcons.kcaretDown,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  size: 15,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2,
                                borderColor: Colors.transparent,
                                borderWidth: 0,
                                borderRadius: 50,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    12, 4, 12, 4),
                                hidesUnderline: true,
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    setState(() {
                                      FFAppState().getTime = dropDownValue!;
                                    });
                                  },
                                  text: 'Bắt đầu',
                                  options: FFButtonOptions(
                                    width: 130,
                                    height: 40,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                        ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                              Text(
                                FFAppState().getTime.toString(),
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
