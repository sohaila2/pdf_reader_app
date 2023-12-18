import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf_reader_app/bloc/pdf_file/pdf_cubit.dart';

import '../model/pdf_file.dart';
import '../services/pdf_services.dart';

class ShowSelectionMenu extends StatelessWidget {
  const ShowSelectionMenu({super.key, required this.pdfFile, required this.pdfList});

  final PDFFile pdfFile;
  final List<PDFFile> pdfList;

  @override
  Widget build(BuildContext context) {
    PdfCubit pdf = PdfCubit.get(context);

    return BlocBuilder<PdfCubit, PdfState>(
      builder: (context, state) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Row(
                  children: [
                    Image.asset(
                      "assets/images/pdf1.png",
                      height: 45,
                    ),
                    Expanded(child: Text(pdfFile.name,maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )),
                  ],
                ),
                onTap: () {
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    Image.asset(
                      "assets/images/open_file.png",
                      height: 40,
                    ),
                    Text('Open File'),
                  ],
                ),
                onTap: () {
                  Navigator.pop(context);
                  pdf.readPDFFile(pdfFile, context);
                },
              ),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.send,
                      size: 40,
                      color: Colors.red,
                    ),
                    SizedBox(width: 10),
                    Text('Email'),
                  ],
                ),
                onTap: () {
                  launchSocialMediaAppIfInstalled('mailto:?subject=Subject&body=Body');
                },
              ),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.share,
                      size: 40,
                      color: Colors.red,
                    ),
                    SizedBox(width: 10),
                    Text('Share File'),
                  ],
                ),
                onTap: () {
                  showShareMenu(context);
                },
              ),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.copy,
                      size: 40,
                      color: Colors.red,
                    ),
                    SizedBox(width: 10),
                    Text('Copy'),
                  ],
                ),
                onTap: () async {
        String originalPath = pdfFile.path;
        String originalFileName = pdfFile.name;
        Directory documentsDirectory = await getApplicationDocumentsDirectory();

        String newFilePath = join(documentsDirectory.path, 'copied_$originalFileName');

        try {
        await File(originalPath).copy(newFilePath);
       // print('PDF copied successfully to $newFilePath');

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('PDF copied successfully')));

        } catch (e) {
     //   print('Error copying PDF: $e');
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error coping PDF')));

        }
        },
              ),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.delete,
                      size: 40,
                      color: Colors.red,
                    ),
                    SizedBox(width: 10),
                    Text('Delete'),
                  ],
                ),
                onTap: () {
                  Navigator.pop(context);
                  pdf.deletePDFFile(pdfFile,pdfList);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
