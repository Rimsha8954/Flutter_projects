import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/Screens/category_screen.dart';

enum FilterList { bbcNews, aryNews, alJazeera, cnn, independent }

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final FilterList? selectedMenu;
  final Function(FilterList) onFilterSelected;

   CustomAppBar({
    super.key,
    required this.selectedMenu,
    required this.onFilterSelected,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: Text(
          "News",
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryScreen()));
        },
        icon: Image.asset(
          "Assets/category.png",
          color: Colors.white,
          height: 20,
          width: 20,
        ),
      ),
      actions: [
        PopupMenuButton<FilterList>(
          initialValue: selectedMenu,
          onSelected: onFilterSelected,
          itemBuilder: (BuildContext context) => <PopupMenuEntry<FilterList>>[
            PopupMenuItem<FilterList>(
              value: FilterList.bbcNews,
              child: Text("BBC News"),
            ),
            PopupMenuItem<FilterList>(
              value: FilterList.aryNews,
              child: Text("Ary News"),
            ),
            PopupMenuItem<FilterList>(
              value: FilterList.alJazeera,
              child: Text("Al-Jazeera"),
            ),
            PopupMenuItem<FilterList>(
              value: FilterList.cnn,
              child: Text("CNN"),
            ),
            PopupMenuItem<FilterList>(
              value: FilterList.independent,
              child: Text("Independent"),
            ),
          ],
        ),
      ],
    );
  }

  /// ✅ This ensures that the AppBar has the correct height
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
