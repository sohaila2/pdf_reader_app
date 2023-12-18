import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/pdf_file.dart';
import '../../services/pdf_services.dart';
import '../../views/pdf_view.dart';
part 'pdf_state.dart';

class PdfCubit extends Cubit<PdfState> {
  PdfCubit() : super(PdfInitial());

  static PdfCubit get(context) => BlocProvider.of(context);


  List<String> recentlyOpenedPaths = [];
  List<PDFFile> pdfFiles = [];
  List<PDFFile> favoriteFiles = [];
  List<PDFFile> recentFiles = [];
  List<PDFFile> searchResults = [];
  TextEditingController searchController = TextEditingController();
  bool isSearchVisible = false;

  void searchPDFFiles(String query) {
    if (query.isEmpty) {
      emit(SearchResults());
    } else {
      searchResults = pdfFiles
          .where((file) => file.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
      emit(SearchResults());
    }
  }


  void toggleSearchVisibility() {
      isSearchVisible = !isSearchVisible;
    emit(ToggleSearch());
  }

  void initState() {
    Future.delayed(Duration.zero, () {
      loadPDFFiles();
      loadRecentlyOpenedPaths();
    });
    emit(InitState());
  }

  Future<void> loadPDFFiles() async {
    final storedPDFFiles = await getStoredPDFFiles();

    if (storedPDFFiles.isNotEmpty) {
      pdfFiles = storedPDFFiles
          .map((json) => PDFFile.fromJson(jsonDecode(json)))
          .toList();
    }
    emit(LoadPDF());

  }

  Future<void> loadRecentlyOpenedPaths() async {
    final storedRecentlyOpenedPaths = await getStoredRecentlyOpenedPaths();

    if (storedRecentlyOpenedPaths.isNotEmpty) {
      recentlyOpenedPaths = storedRecentlyOpenedPaths;
    }

    emit(LoadRecentlyPDF());
  }

  Future<void> pickPDFFiles() async {

    List<PlatformFile> pickedFiles = await pickPDFFilesFromPlatform();

    if (pickedFiles.isNotEmpty) {
      pdfFiles.addAll(pickedFiles.map((file) => PDFFile(path: file.path!)));
      savePDFFiles(pdfFiles);
      emit(PickPDF());
    }
  }

  Future<void> openPDFFile(String path, BuildContext context) async {

    recentlyOpenedPaths.insert(0, path);
    if (recentlyOpenedPaths.length > 5) {
      recentlyOpenedPaths.removeLast();
    }
    saveRecentlyOpenedPaths(recentlyOpenedPaths);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PDFViewerScreen(path, pdfFiles),
      ),
    );
  }

  void toggleFavorite(PDFFile pdfFile) {
    pdfFile.isFavorite = !pdfFile.isFavorite;
    savePDFFiles(pdfFiles);
    emit(ToggleFavorites());
  }

  void readPDFFile(PDFFile pdfFile, BuildContext context) {
    openPDFFile(pdfFile.path, context);
  }

  void deletePDFFile(PDFFile pdfFile, List<PDFFile> pdfList) {
    pdfList.remove(pdfFile);
    savePDFFiles(pdfList);
    emit(DeletePDf());
  }


}