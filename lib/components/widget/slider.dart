import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final PageController _controller = PageController();
  final List<String> _images = [
    'assets/images/home/Slider.png',
    'assets/images/home/Slider2.png',
  ];

  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_controller.hasClients) {
        _currentPage = (_currentPage + 1) % _images.length;
        _controller.jumpToPage(_currentPage); // 👈 instant switch
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: _images.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Image.asset(
                _images[index],
                fit: BoxFit.cover,
                width: double.infinity,
              );
            },
          ),

          // Custom Indicator
          Positioned(
            bottom: 10.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_images.length, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                  height: 8.w,
                  width: 8.w,
                  decoration: BoxDecoration(
                    color:
                        _currentPage == index
                            ? Color.fromRGBO(232, 181, 177, 1)
                            : Colors.white,
                    borderRadius: BorderRadius.circular(
                      2.r,
                    ), // smaller for squarer corners
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
