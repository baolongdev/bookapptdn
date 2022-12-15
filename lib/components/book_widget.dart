import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BookWidget extends StatefulWidget {
  const BookWidget({
    Key? key,
    this.image,
    this.nameBook,
    this.author,
    this.width,
    this.sizeText,
    this.sizeTextSmall,
  }) : super(key: key);

  final String? image;
  final String? nameBook;
  final String? author;
  final int? width;
  final int? sizeText;
  final int? sizeTextSmall;

  @override
  _BookWidgetState createState() => _BookWidgetState();
}

class _BookWidgetState extends State<BookWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 1, 0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                widget.image!,
                width: widget.width?.toDouble(),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: widget.width?.toDouble(),
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 14, 0, 0),
                child: Text(
                  widget.nameBook!,
                  maxLines: 2,
                  style: FlutterFlowTheme.of(context).subtitle1.override(
                        fontFamily: 'Poppins',
                        fontSize: widget.sizeText?.toDouble(),
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            ),
            Text(
              widget.author!,
              style: FlutterFlowTheme.of(context).bodyText2.override(
                    fontFamily: 'Poppins',
                    fontSize: widget.sizeTextSmall?.toDouble(),
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
