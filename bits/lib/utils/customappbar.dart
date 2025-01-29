import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackArrow;
  final String? name;
  final String? selectedRole;

  const CustomAppBar({
    required this.title,
    this.showBackArrow = true,
    this.name,
    this.selectedRole,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth * 0.05; // 5% of screen width
    double spacing = screenWidth * 0.02; // 2% of screen width

    return AppBar(
      backgroundColor: const Color.fromARGB(255, 117, 117, 228),
      leading:
          showBackArrow ? const BackButton(color: Colors.white) : Container(),
      title: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: fontSize, // Adjust font size based on screen width
              ),
            ),
          ),
          if (name != null && selectedRole != null)
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      name!,
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.normal,
                      ),
                      overflow: TextOverflow
                          .ellipsis, // Prevents overflow by adding '...'
                    ),
                  ),
                  SizedBox(
                    width: spacing,
                  ),
                  Flexible(
                    child: Text(
                      selectedRole!,
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.normal,
                      ),
                      overflow: TextOverflow
                          .ellipsis, // Prevents overflow by adding '...'
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
