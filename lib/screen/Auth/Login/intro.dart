import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taj_alsafa/components/componants.dart';
import 'package:taj_alsafa/const/colors.dart';
import 'package:taj_alsafa/const/text_style.dart';
import 'package:taj_alsafa/screen/Auth/Login/cubit/login_cubit.dart';
import 'package:taj_alsafa/screen/Auth/Login/login.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize video from assets
    _controller = VideoPlayerController.asset('assets/videos/into.mp4')
      ..initialize().then((_) {
        _controller.setLooping(true);
        _controller.setVolume(0);
        _controller.play();
        setState(() {}); // To refresh the widget when initialized
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appbar,
      body: Stack(
        children: [
          // Background video
          SizedBox.expand(
            child:
                _controller.value.isInitialized
                    ? FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: _controller.value.size.width,
                        height: _controller.value.size.height,
                        child: VideoPlayer(_controller),
                      ),
                    )
                    : Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    ),
          ),

          // Centered Maintenance text
          Center(
            child: Text(
              'Maintenance',
              style: AppTextStyles.imeenStyle.copyWith(
                color: Colors.white,
                fontSize: 33.sp,
                fontFamily: 'Emeralde',
              ),
            ),
          ),

          // Login button at bottom center
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: ElevatedButton(
                onPressed: () {
                  navigatAndFinish(
                    context: context,
                    page: BlocProvider(
                      create: (context) => LoginCubit(),
                      child: Login(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  foregroundColor: appbar,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
                child: Text('Login', style: AppTextStyles.secondaryStyle),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
