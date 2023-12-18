part of 'pdf_cubit.dart';

@immutable
abstract class PdfState {}
class SearchResults extends PdfState {

}

class PdfInitial extends PdfState {}

class InitState extends PdfState {}

class LoadPDF extends PdfState {}

class LoadRecentlyPDF extends PdfState {}

class PickPDF extends PdfState {}

class ToggleFavorites extends PdfState {}

class ToggleSearch extends PdfState {}

class DeletePDf extends PdfState {}
