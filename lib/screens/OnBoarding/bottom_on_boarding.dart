import 'package:flutter/material.dart';
import 'package:lettutor_app/contants.dart';

class BottomOnBoarding extends StatelessWidget {
  const BottomOnBoarding({
    Key? key,
    required List<Widget> pages,
    required int currentPage,
    required PageController controller,
  }) : _pages = pages, _currentPage = currentPage, _controller = controller, super(key: key);

  final List<Widget> _pages;
  final int _currentPage;
  final PageController _controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _pages.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 10,
              width: index == _currentPage ? 30 : 10,
              margin:
                  const EdgeInsets.symmetric(horizontal: 5, vertical: 30),
              decoration: BoxDecoration(
                color: index == _currentPage
                    ? mainColor
                    : mainColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            _controller.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOutQuint,
            );
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            alignment: Alignment.center,
            height: 70,
            width: _currentPage == _pages.length - 1 ? 200 : 70, 
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: mainColor),
            child: _currentPage == _pages.length - 1
                ? const Text("Get Started",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ))
                : const Icon(
                    Icons.navigate_next,
                    size: 50,
                    color: Colors.white,
                  ),
          ),
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}
