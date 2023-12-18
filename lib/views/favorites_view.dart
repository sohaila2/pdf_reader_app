import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf_reader_app/components/tools_container.dart';
import 'package:pdf_reader_app/views/home_view.dart';
import 'package:pdf_reader_app/views/pdf_view.dart';
import 'package:pdf_reader_app/views/recent_view.dart';

import '../bloc/pdf_file/pdf_cubit.dart';
import '../components/navigation_bar.dart';
import '../components/pdf_list_row.dart';
import '../model/pdf_file.dart';
import '../services/pdf_services.dart';

class FavoritesView extends StatelessWidget {

  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    PdfCubit pdf = PdfCubit.get(context);

    pdf.favoriteFiles =
        pdf.pdfFiles.where((file) => file.isFavorite).toList();
    return Scaffold(
        backgroundColor: Colors.red,
        body: Column(
          children: [
            ToolsContainer(
              title: "Favorites",
            ),
            Expanded(
              child: BlocBuilder<PdfCubit, PdfState>(
                builder: (context, state) {
                  return BlocBuilder<PdfCubit, PdfState>(

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
                   }else{
                        return Container(
                          decoration: BoxDecoration(
                            color: Color(0xfff8e4e1),
                            borderRadius: const BorderRadius.only(topLeft: Radius
                                .circular(16.0), topRight: Radius.circular(16.0)),
                          ),
                          child: ListView.builder(
                            itemCount: pdf.favoriteFiles.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: PDFListRow(
                                  text: pdf.favoriteFiles[index].name,
                                  isFavorite: pdf.favoriteFiles[index].isFavorite,
                                  onFavoritePressed: () {
                                    pdf.toggleFavorite(pdf.favoriteFiles[index]);
                                  },
                                  onMorePressed: () {
                                    showSelectionMenu(
                                        context, pdf.favoriteFiles[index], pdf.favoriteFiles);
                                  },
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          PDFViewerScreen(
                                              pdf.favoriteFiles[index].path,
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
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: 2,
          onTabTapped: (index) {
            if (index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeView(),
                ),
              );
            } else if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      RecentView(),
                ),
              );
            }
          },
        )
    );
  }
}
