import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EpisodeCardWidget extends StatefulWidget {
  const EpisodeCardWidget({
    Key? key,
    this.image,
    this.episode,
    this.name,
    this.duration,
  }) : super(key: key);

  final String? image;
  final String? episode;
  final String? name;
  final String? duration;

  @override
  _EpisodeCardWidgetState createState() => _EpisodeCardWidgetState();
}

class _EpisodeCardWidgetState extends State<EpisodeCardWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              widget.image!,
              width: 150,
              height: 100,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 8, 8, 8),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.episode!,
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                    child: Text(
                      widget.name!,
                      maxLines: 1,
                      style: FlutterFlowTheme.of(context).bodyText2,
                    ),
                  ),
                  Text(
                    widget.duration!,
                    style: FlutterFlowTheme.of(context).bodyText2,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 24, 0),
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.play_arrow_rounded,
                color: FlutterFlowTheme.of(context).primaryBtnText,
                size: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
