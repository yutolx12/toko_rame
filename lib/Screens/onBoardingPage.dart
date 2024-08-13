import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:toko_rame/Screens/homePage.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentIndex = 0;
  late PageController _pageController;

  final List<String> titles = [
    'Gratis Materi Belajar Menjadi Seller Handal',
    'Ribuan Produk dengan Kualitas Terbaik',
    'Toko Online Unik Untuk Kamu Jualan',
  ];

  final List<String> subtitles = [
    'Nggak bisa jualan? Jangan khawatir, Tokorame akan membimbing kamu hingga menjadi seller langsung dari ahlinya.',
    'Tokorame menyediakan ribuan produk dengan kualitas terbaik dari seller terpercaya.',
    'Subdomain unik dan toko online profesional siap pakai!',
  ];

  final List<String> images = [
    'assets/onboarding1.png',
    'assets/onboarding2.png',
    'assets/onboarding3.png',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> toHomePage() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.blue, // Set the background to blue
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Image.asset(
                images[index],
                height: size.height * 0.6,
                width: size.width,
                fit: BoxFit.cover,
              );
            },
          ),
          Positioned(
            top: 40,
            right: 20,
            child: TextButton(
              onPressed: () {
                // Navigate directly to the home page
                toHomePage();
              },
              child: Text(
                'Lewati',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: size.height *
                0.4, // Adjust position to be above the fixed white container
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller:
                    _pageController, // Connect to the PageView controller
                count: images.length, // Number of dots
                effect: ExpandingDotsEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  activeDotColor: Colors.white, // Active dot color
                  dotColor: Colors.white.withOpacity(0.5), // Inactive dot color
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0, // Align to the bottom of the screen
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              child: Container(
                color: Colors.white,
                height: 250, // Fixed height for the white space
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      titles[currentIndex],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      subtitles[currentIndex],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (currentIndex == images.length - 1) {
                          // Navigate to the next page or home
                        } else {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        minimumSize: Size(size.width,
                            50), // Make the button stretch full width
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Selanjutnya',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
