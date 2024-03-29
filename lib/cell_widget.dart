import 'package:flutter/material.dart';
import 'package:minesweeper/cell.dart';
import 'package:google_fonts/google_fonts.dart';

class CellWidget extends StatefulWidget {
  const CellWidget({
    Key key,
    @required this.size,
    @required this.cell,
  }) : super(key: key);

  final int size;
  final CellModel cell;

  @override
  _CellWidgetState createState() => _CellWidgetState();
}

class _CellWidgetState extends State<CellWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 1, bottom: 1),
      height: MediaQuery.of(context).size.width / widget.size + 1,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]),
        color: widget.cell.isRevealed ? (widget.cell.isMine ? Colors.red[100] : Colors.grey[200 + (widget.cell.value * 50)]) : Colors.white,
      ),
      child: (widget.cell.isMine && widget.cell.isRevealed)
          ? Center(
              child: Icon(
                Icons.clear,
                color: Colors.red,
              ),
            )
          : widget.cell.isFlagged
              ? Center(
                  child: Icon(
                    Icons.flag,
                    color: Colors.red[400],
                  ),
                )
              : widget.cell.isRevealed
                  ? Center(
                      child: Text(
                        widget.cell.value.toString(),
                        style: GoogleFonts.robotoMono(
                          fontWeight: FontWeight.w700,
                          fontSize: 20.0,
                        ),
                      ),
                    )
                  : Container(),
    );
  }
}
