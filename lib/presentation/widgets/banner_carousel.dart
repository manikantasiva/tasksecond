// import 'package:flutter/material.dart';

// class BannerCarousel extends StatefulWidget {
//   const BannerCarousel({super.key});

//   @override
//   State<BannerCarousel> createState() => _BannerCarouselState();
// }

// class _BannerCarouselState extends State<BannerCarousel> {
//   final List<String> bannerImages = [
//     'assets/images/vehicle1.jpg',
//     'assets/images/vehicle2.jpg',
//     'assets/images/vehicle1.jpg',
//   ];

//   int _currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           height: 200,
//           child: PageView.builder(
//             itemCount: bannerImages.length,
//             onPageChanged: (index) {
//               setState(() {
//                 _currentIndex = index;
//               });
//             },
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: Image.asset(
//                     bannerImages[index],
//                     fit: BoxFit.cover,
//                     width: double.infinity,
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//         const SizedBox(height: 8),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: List.generate(
//             bannerImages.length,
//             (index) => AnimatedContainer(
//               duration: const Duration(milliseconds: 300),
//               margin: const EdgeInsets.symmetric(horizontal: 4),
//               height: 8,
//               width: _currentIndex == index ? 16 : 8,
//               decoration: BoxDecoration(
//                 color: _currentIndex == index ? Colors.black : Colors.grey,
//                 borderRadius: BorderRadius.circular(4),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'dart:async';
import 'package:flutter/material.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({super.key});

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  final List<String> bannerImages = [
    'assets/images/vehicle1.jpg',
    'assets/images/vehicle2.jpg',
    'assets/images/vehicle1.jpg',
    'assets/images/vehicle2.jpg',
    'assets/images/login-page.png',
  ];

  final PageController _pageController = PageController();
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (_pageController.hasClients) {
        final nextPage = (_currentIndex + 1) % bannerImages.length;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        setState(() {
          _currentIndex = nextPage;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: _pageController,
            itemCount: bannerImages.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    bannerImages[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            bannerImages.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              height: 8,
              width: _currentIndex == index ? 16 : 8,
              decoration: BoxDecoration(
                color: _currentIndex == index ? Colors.black : Colors.grey,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
