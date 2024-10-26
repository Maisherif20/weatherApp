import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weatherapp/presentationLayer/ui/otherCitiesWeather/otherCitiesWeatherWidget.dart';
import 'package:weatherapp/presentationLayer/ui/search/searchWidget.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward(); // Start the animation immediately

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // Start from below the screen
      end: Offset.zero, // End at the original position
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCubic,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SlideTransition(
        position: _offsetAnimation,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xFF0A0B39),
                Color(0xFF1D85E4),
                Color(0xFF23224A),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 50.r, left: 10.r, right: 10.r),
            child: const SearchWidget(),
          ),
        ),
      ),
    );
  }
}