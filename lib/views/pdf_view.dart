import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:pdf_reader_app/components/pdf_view/app_bar_icon.dart';
import 'package:pdf_reader_app/components/show_share_menu.dart';

import '../model/pdf_file.dart';
import '../services/pdf_services.dart';

class PDFViewerScreen extends StatefulWidget {
  final String pdfPath;
  final List<PDFFile> pdfFiles;

   PDFViewerScreen(this.pdfPath, this.pdfFiles);

  @override
  State<PDFViewerScreen> createState() => _PDFViewerScreenState();
}

class _PDFViewerScreenState extends State<PDFViewerScreen> {

  int totalPages = 0;
  int currentPage = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AppBarIcon(icon: Icon(Icons.print)),
            SizedBox(width: 10),
            AppBarIcon(icon: Icon(Icons.share),onPressedCallback: (){
              showShareMenu(context);
            },),
            SizedBox(width: 10),
            AppBarIcon(icon: Icon(Icons.star_half)),

          ],
        ),
      ),
      body:  Column(
        children: [
          Expanded(
            child: PDFView(
              filePath: widget.pdfPath,
              autoSpacing: true,
              pageSnap: true,
              onPageChanged: (int? page, int? total) {
                if (page != null && total != null) {
                  setState(() {
                    currentPage = page;
                    totalPages = total;
                  });
                }
              },

            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Page: ${currentPage + 1}',

                ),
                SizedBox(width: 16.0),
                Text(
                  'of $totalPages',

                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
