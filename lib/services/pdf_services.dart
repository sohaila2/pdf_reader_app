import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/show_selection_menu.dart';
import '../components/show_share_menu.dart';
import '../model/pdf_file.dart';
import 'package:url_launcher/url_launcher.dart';


Future<List<String>> getStoredPDFFiles() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('pdfFiles') ?? [];
  }

Future<List<String>> getStoredRecentlyOpenedPaths() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getStringList('recentlyOpenedPaths') ?? [];
}

Future<List<PlatformFile>> pickPDFFilesFromPlatform() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['pdf'],
    allowMultiple: true,
  );
  return result?.files ?? [];
}


Future<void> savePDFFiles(List<PDFFile> files) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setStringList(
      'pdfFiles', files.map((file) => jsonEncode(file.toJson())).toList());
}

Future<void> saveRecentlyOpenedPaths(List<String> paths) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setStringList('recentlyOpenedPaths',paths);
}

Future<void> requestPermission(BuildContext context) async {
  await Permission.storage.request();
}

void showShareMenu(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return ShowShareMenu();
    },
  );
}


void showSelectionMenu(BuildContext context, PDFFile pdfFile, List<PDFFile> pdfList) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return ShowSelectionMenu(pdfFile: pdfFile, pdfList: pdfList);
    },
  );
}

void showSettingsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Permission Required"),
        content: Text("Please enable storage access in the app settings."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("OK"),
          ),
        ],
      );
    },
  );
}
Future<void> launchSocialMediaAppIfInstalled(String url) async {
  try {
    bool launched = await launch(url, forceSafariVC: false);

    if (!launched) {
      launch(url);
    }
  } catch (e) {
    launch(url);
  }
}