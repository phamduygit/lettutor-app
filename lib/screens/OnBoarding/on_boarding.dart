import 'package:flutter/material.dart';
import 'package:lettutor_app/contants.dart';
import 'package:lettutor_app/screens/OnBoarding/slider_page.dart';

import 'bottom_on_boarding.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final List<Widget> _pages = [
    const SliderPage(
      image: "assets/images/learnonline.svg",
      title: "Learn english, everywhere, everytime",
      description:
          "Build English proficiency and confidence through real conversations with friendly tutors from the US, UK, Australia, and more. All you need is your device!",
    ),
    const SliderPage(
      image: "assets/images/community.svg",
      title: "Hundreds of Top Certified ESL Teachers",
      description: "Our teachers are friendly, professional, and experienced ESL teachers.",
    ),
    const SliderPage(
      image: "assets/images/easy_to_access.svg",
      title: "3 Simple steps to join online class",
      description: "Find a tutor -> Book a session -> Start learning",
    ),
  ];
  int _currentPage = 0;
  final PageController _controller = PageController();
  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            onPageChanged: _onchanged,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => _pages[index],
            itemCount: _pages.length,
          ),
          BottomOnBoarding(
              pages: _pages,
              currentPage: _currentPage,
              controller: _controller),
          const Positioned(
            child: Text(
              "Skip",
              style: TextStyle(
                  color: mainColor,
                  fontSize: 18,
                  decoration: TextDecoration.underline),
            ),
            top: 50,
            right: 20,
          )
        ],
      ),
    );
  }
}
