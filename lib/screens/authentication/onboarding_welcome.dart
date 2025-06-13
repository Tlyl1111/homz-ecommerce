import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timberr/constants.dart';
import 'package:timberr/utils/app_routes.dart';
import 'package:timberr/utils/font_style.dart';
import 'package:timberr/widgets/buttons/primary_button.dart';

class OnBoardingWelcomeScreen extends StatefulWidget {
  const OnBoardingWelcomeScreen({super.key});

  @override
  _OnBoardingWelcomeScreenState createState() => _OnBoardingWelcomeScreenState();
}

class _OnBoardingWelcomeScreenState extends State<OnBoardingWelcomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _toLoginScreen() {
    Get.offAllNamed(AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: [
              _buildPage(
                imagePath: 'assets/onboarding_1.png',
                title: 'Discover',
                subtitle: 'Unlock a world of stunning furniture and\ndecor for your perfect home',
                buttonText: 'Start Exploring',
                onButtonPressed: () {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                },
                textAboveImage: true,
                isSecondPage: false,
              ),
              _buildPage(
                imagePath: 'assets/onboarding_2.png',
                title: 'Customize',
                subtitle: 'Bring your unique vision to life\nwith personalized interior solutions',
                buttonText: 'Design Your Space',
                onButtonPressed: () {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                },
                textAboveImage: false,
                isSecondPage: true,
              ),
              _buildPage(
                imagePath: 'assets/onboarding_3.png',
                title: 'Smart Shopping',
                subtitle: 'Experience hassle-free furniture shopping\nwith quality, affordability, convenience',
                buttonText: 'Shop now',
                onButtonPressed: _toLoginScreen,
                textAboveImage: true,
                isSecondPage: false,
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == index ? 20 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? kColorPrimary : kGrey,
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage({
    required String imagePath,
    required String title,
    required String subtitle,
    required String buttonText,
    required VoidCallback onButtonPressed,
    required bool textAboveImage,
    required bool isSecondPage,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: isSecondPage ? kColorPrimaryLight : kColorBackground,
      ),
      child: Column(
        children: [
          if (textAboveImage) ...[
            const SizedBox(height: 80),
            Text(title, style: HTextTheme.title32SemiBoldDark),
            const SizedBox(height: 15),
            Text(subtitle, style: HTextTheme.body16LightLight, textAlign: TextAlign.center),
            const SizedBox(height: 20),
          ],
          Expanded(
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
          if (!textAboveImage) ...[
            const SizedBox(height: 20),
            Text(title, style: HTextTheme.title32SemiBoldDark.copyWith(color: Colors.white)),
            const SizedBox(height: 15),
            Text(subtitle,
                style: HTextTheme.body16LightLight.copyWith(color: Colors.white), textAlign: TextAlign.center),
            const SizedBox(height: 20),
          ],
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: PrimaryButton(text: buttonText, onTap: onButtonPressed),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}
