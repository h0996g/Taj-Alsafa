import 'package:flutter/material.dart';
import 'package:taj_alsafa/const/colors.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          // -- HEADER SECTION --
          Container(
            height: 220, // Adjust height if needed
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/drawer/header.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 16),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // -- AVATAR + EDIT ICON (STACK) --
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        CircleAvatar(
                          radius: 45,
                          backgroundColor: primaryColor,
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(
                              'assets/images/drawer/Ellipse.png',
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -5,
                          right: 10,
                          // left: -0,
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.edit,
                              size: 14,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // -- USER NAME --
                    const Text(
                      "Moamen Qudah",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // -- DRAWER MENU ITEMS --
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildDrawerItem(
                  title: "About Us",
                  onTap: () => Navigator.pop(context),
                ),
                _buildDrawerItem(
                  title: "Property Info",
                  onTap: () => Navigator.pop(context),
                ),
                _buildDrawerItem(
                  title: "Terms And Conditions",
                  onTap: () => Navigator.pop(context),
                ),

                // -- CUSTOM DIVIDER --
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Divider(
                    color: Colors.grey,
                    indent: 1,
                    endIndent: 200,
                    thickness: 1.0,
                  ),
                ),

                _buildDrawerItem(
                  title: "Contact Us",
                  onTap: () => Navigator.pop(context),
                ),
                _buildDrawerItem(
                  title: "My documents",
                  onTap: () => Navigator.pop(context),
                ),
                _buildDrawerItem(
                  title: "Log Out",
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// A helper method to build each drawer item
  Widget _buildDrawerItem({
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, color: Colors.black),
      ),
      trailing: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.shade200,
        ),
        child: const Icon(
          Icons.arrow_forward_ios,
          size: 14,
          color: Colors.black54,
        ),
      ),
      onTap: onTap,
    );
  }
}
