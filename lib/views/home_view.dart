import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf_reader_app/bloc/pdf_file/pdf_cubit.dart';
import 'package:pdf_reader_app/constants.dart';
import 'package:pdf_reader_app/views/premium_view.dart';
import 'package:pdf_reader_app/views/recent_view.dart';
import 'package:permission_handler/permission_handler.dart';
import '../components/navigation_bar.dart';
import '../components/pdf_list_row.dart';
import '../components/show_selection_menu.dart';
import '../components/tools_container.dart';
import '../model/pdf_file.dart';
import '../services/pdf_services.dart';
import 'favorites_view.dart';

class HomeView extends StatelessWidget {
  static const String id = "HomeView";

   HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    PdfCubit pdf = PdfCubit.get(context);
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        children: [
        const ToolsContainer(title: "All Files"),
          Expanded(
            child: BlocBuilder<PdfCubit, PdfState>(
              builder: (context, state) {
              if(state is SearchResults && pdf.searchController.text.isNotEmpty){
                return Container(
                  decoration: BoxDecoration(
                    color: kSecondColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0)),
                  ),
                  child: ListView.builder(
                    itemCount: pdf.searchResults.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: PDFListRow(
                          text: pdf.searchResults[index].name,
                          isFavorite: pdf.searchResults[index].isFavorite,
                          onFavoritePressed: () {
                            pdf.toggleFavorite(pdf.searchResults[index]);
                          },
                          onMorePressed: () {
                            showSelectionMenu(context, pdf.searchResults[index], pdf.searchResults);
                          },
                        ),
                        onTap: () {
                          pdf.openPDFFile(pdf.searchResults[index].path, context);
                        },
                      );
                    },
                  ),
                );
              }
              else{
                return Container(
                  decoration: BoxDecoration(
                    color: kSecondColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0)),
                  ),
                  child: ListView.builder(
                    itemCount: pdf.pdfFiles.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: PDFListRow(
                          text: pdf.pdfFiles[index].name,
                          isFavorite: pdf.pdfFiles[index].isFavorite,
                          onFavoritePressed: () {
                            pdf.toggleFavorite(pdf.pdfFiles[index]);
                          },
                          onMorePressed: () {
                            showSelectionMenu(context, pdf.pdfFiles[index], pdf.pdfFiles);
                          },
                        ),
                        onTap: () {
                          pdf.openPDFFile(pdf.pdfFiles[index].path, context);
                        },
                      );
                    },
                  ),
                );
              }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 28.0, right: 20.0),
        child: FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: () async{
            if(await Permission.storage.request().isDenied)
              {
                await requestPermission(context);
              }

            pdf.pickPDFFiles();
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 40,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 0,
        onTabTapped: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RecentView(),
              ),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FavoritesView(),
              ),
            );
          }
        },
      ),
    );
  }
}
