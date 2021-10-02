import 'package:flutter/material.dart';
import 'package:lettutor_app/screens/OnBoarding/slider_page.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final List<Widget> _pages = [
    const SliderPage(
      image: "assets/images/community.svg",
      title: "Heloo",
      description: "Hello",
    ),
    const SliderPage(
      image: "assets/images/community.svg",
      title: "Heloo",
      description: "Hello",
    ),
    const SliderPage(
      image: "assets/images/community.svg",
      title: "Heloo",
      description: "Hello",
    ),
  ];
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => _pages[index],
            itemCount: _pages.length,
          )
        ],
      ),
    );
  }
}
