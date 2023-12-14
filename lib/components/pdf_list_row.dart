import 'package:flutter/material.dart';

class PDFListRow extends StatelessWidget {
  final String text;
  final bool isFavorite;
  final VoidCallback onFavoritePressed;
  final VoidCallback onMorePressed;

  PDFListRow({
    required this.text,
    required this.isFavorite,
    required this.onFavoritePressed,
    required this.onMorePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          "assets/images/pdf1.png",
          height: 50,
        ),
        SizedBox(width: 8),
        Expanded(child: Text(text,maxLines: 2,
          overflow: TextOverflow.ellipsis,
        )),
        IconButton(
          icon: isFavorite
              ? const Icon(Icons.star, color: Colors.red)
              : const Icon(Icons.star_border),
          onPressed: onFavoritePressed,
        ),
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: onMorePressed,
        ),
      ],
    );
  }
}
