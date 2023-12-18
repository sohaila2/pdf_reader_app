import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf_reader_app/bloc/pdf_file/pdf_cubit.dart';
import 'package:pdf_reader_app/components/tools_container.dart';
import 'package:pdf_reader_app/views/home_view.dart';
import 'package:pdf_reader_app/views/pdf_view.dart';

import '../components/navigation_bar.dart';
import '../components/pdf_list_row.dart';
import '../constants.dart';
import '../model/pdf_file.dart';
import '../services/pdf_services.dart';
import 'favorites_view.dart';

class RecentView extends StatelessWidget {
  const RecentView({super.key});


  @override
  Widget build(BuildContext context) {
    PdfCubit pdf = PdfCubit.get(context);

    pdf.recentFiles = pdf.pdfFiles.where((file) =>
        pdf.recentlyOpenedPaths.contains(file.path)).toList();

    return Scaffold(
        backgroundColor: Colors.red,
        body: Column(
          children: [
            const ToolsContainer(title: "Recent",),
            Expanded(
              child: BlocBuilder<PdfCubit, PdfState>(
                builder: (context, state) {
                  if(state is SearchResults && pdf.searchController.text.isNotEmpty)
                  {
                    return Container(
                      decoration: BoxDecoration(
                        color: Color(0xfff8e4e1),
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
                        color: Color(0xfff8e4e1),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0)),
                      ),
                      child: ListView.builder(
                        itemCount: pdf.recentFiles.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: PDFListRow(
                              text: pdf.recentFiles[index].name,
                              isFavorite: pdf.recentFiles[index].isFavorite,
                              onFavoritePressed: () {
                                pdf.toggleFavorite(pdf.recentFiles[index]);
                              },
                              onMorePressed: () {
                                showSelectionMenu(
                                    context, pdf.recentFiles[index], pdf.recentFiles);
                              },
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PDFViewerScreen(
                                          pdf.recentFiles[index].path,
                                          pdf.pdfFiles),
                                ),
                              );
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

        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: 1, // set the appropriate index based on your use case
          onTabTapped: (index) {
            if (index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      HomeView(),
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
        )

    );
  }
}
