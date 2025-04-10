import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taj_alsafa/components/componants.dart';
import 'package:taj_alsafa/const/colors.dart';
import 'package:taj_alsafa/const/text_style.dart';
import 'package:taj_alsafa/screen/profile/edite/info/edite_info.dart';

class ProfileAvatar extends StatefulWidget {
  final File? imageFile;
  final String? imageUrl;
  final bool isEditable;
  final Widget? icon;
  final Function(ImageSource source) onImagePicked;

  const ProfileAvatar({
    super.key,
    this.imageFile,
    required this.onImagePicked,
    this.imageUrl,
    this.isEditable = false,
    this.icon,
  });

  @override
  _ProfileAvatarState createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> {
  void _showImageSourceDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Select Image Source", style: AppTextStyles.imeenStyle),
                SizedBox(height: 10),
                Text(
                  "Choose the image source",
                  style: AppTextStyles.secondaryStyle,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                        widget.onImagePicked(ImageSource.camera);
                      },
                      icon: Icon(
                        Icons.camera_alt,
                        size: 18,
                        color: Colors.white,
                      ),
                      label: Text(
                        "Camera",
                        style: AppTextStyles.smallStyle.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                        widget.onImagePicked(ImageSource.gallery);
                      },
                      icon: Icon(
                        Icons.photo_library,
                        size: 18,
                        color: Colors.white,
                      ),
                      label: Text(
                        "Gallery",
                        style: AppTextStyles.smallStyle.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: primaryColor,
          child: CircleAvatar(
            radius: 45,
            backgroundImage:
                widget.imageFile != null
                    ? FileImage(widget.imageFile!)
                    : widget.imageUrl != null
                    ? File(widget.imageUrl!).existsSync()
                        ? FileImage(File(widget.imageUrl!))
                        : AssetImage(
                          'assets/images/drawer/Sample_User_Icon.png',
                        )
                    : AssetImage('assets/images/drawer/Sample_User_Icon.png'),
            backgroundColor: Colors.transparent,
          ),
        ),
        Positioned(
          bottom: -5,
          right: 10,
          child: GestureDetector(
            onTap: () {
              widget.isEditable
                  ? navigatAndReturn(context: context, page: EditeProfile())
                  : _showImageSourceDialog();
            },
            child: Material(
              elevation: 4,
              shape: const CircleBorder(),
              child: Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child:
                    widget.icon ??
                    SvgPicture.asset('assets/svg/pencil.svg', fit: BoxFit.none),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
