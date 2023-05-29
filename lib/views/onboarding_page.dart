import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:gli_check/views/home_page.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key, required this.title});

  final String title;

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  _storeOnBoardingInfo() async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
  }

  Widget buildPage({
    required Color color,
    required String urlImage,
    required String title,
    required String subtitle,
  }) =>
      Container(
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              urlImage,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            const SizedBox(
              height: 64.0,
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.teal.shade700,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.black45,
                ),
              ),
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),*/
      body: Container(
        padding: const EdgeInsets.only(
          bottom: 80.0,
        ),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() => isLastPage = index == 2);
          },
          children: [
            buildPage(
              color: Colors.green.shade100,
              urlImage: 'lib/assets/pic_1.png',
              title: 'Title 01',
              subtitle: 'Insert description here 01',
            ),
            buildPage(
              color: Colors.green.shade100,
              urlImage: 'lib/assets/pic_2.png',
              title: 'Title 02',
              subtitle: 'Insert description here 02',
            ),
            buildPage(
              color: Colors.green.shade100,
              urlImage: 'lib/assets/pic_3.png',
              title: 'Title 03',
              subtitle: 'Insert description here 03',
            ),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? TextButton(
              onPressed: () async {
                await _storeOnBoardingInfo();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                foregroundColor: Colors.grey.shade800,
                backgroundColor: Colors.amber.shade100,
                minimumSize: const Size.fromHeight(80.0),
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              height: 80.0,
              color: Colors.amber.shade100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => controller.jumpToPage(2),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.grey.shade800,
                    ),
                    child: const Text('Skip'),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: const WormEffect(
                        dotHeight: 12.0,
                        dotWidth: 12.0,
                        spacing: 14.0,
                        dotColor: Colors.black12,
                        activeDotColor: Colors.black54,
                      ),
                      onDotClicked: (index) => controller.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.grey.shade800,
                    ),
                    child: const Text('Next'),
                  )
                ],
              ),
            ),
    );
  }
}
