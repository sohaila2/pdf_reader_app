import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/pdf_file/pdf_cubit.dart';
import '../views/premium_view.dart';

class ToolsContainer extends StatelessWidget {
  const ToolsContainer({
    super.key, required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PdfCubit, PdfState>(
      builder: (context, state) {
        PdfCubit pdf = PdfCubit.get(context);
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 28.0, right: 28.0, left: 26.0),
              child: Row(
                children: [
                  Text(
                    'PDF Reader',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, PremiumView.id);
                    },
                    child: Image.asset(
                      "assets/images/permium.png",
                      height: 50,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      pdf.toggleSearchVisibility();
                    },
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  if (pdf.isSearchVisible) // Show TextField conditionally
                    Expanded(
                      child: TextField(
                        controller: pdf.searchController,
                        onChanged: (query) {
                          pdf.searchPDFFiles(query);
                        },
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          hintStyle: TextStyle(color: Colors.white,
                              fontSize: 10),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        );
      },
    );
  }
}
