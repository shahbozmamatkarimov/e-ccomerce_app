import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const menuIcon = 'assets/aside/menu.svg';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          titleSpacing: 0,
          title: Row(
            children: [
              Center(
                child: Container(
                  color: const Color(0xFF111536),
                  width: 72,
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: SvgPicture.asset(
                    'assets/aside/menu.svg',
                    height: 13,
                    width: 72,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 60,
                child: Container(
                  width: 363,
                  height: 40,
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  color: const Color(0xFF0D0F23),
                  child: SearchBar(
                    padding: const MaterialStatePropertyAll<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 16.0)),
                    onTap: () {},
                    onChanged: (_) {},
                    leading: const Icon(Icons.search),
                  ),
                ),
              )
            ],
          ),
        ),
        body: Row(
          children: [
            Container(
              width: 72,
              color: const Color(0xFF111536),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return const MainCategory(
                    imagePath: 'assets/images/home.png',
                    text: 'Uylar',
                  );
                },
              ),
            ),
            Container(
              width: 363,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              color: const Color(0xFF111536),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return const Category(
                    imagePath: 'assets/images/home.png',
                    text: 'Uylar',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MainCategory extends StatelessWidget {
  final String imagePath;
  final String text;

  const MainCategory({
    super.key,
    required this.imagePath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Column(
        children: [
          Transform.translate(
            offset: const Offset(0, 13),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  imagePath,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5), // Add some space between image and text
          Transform.translate(
            offset: const Offset(0, 7),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imagePath;
  final String text;

  const Category({
    super.key,
    required this.imagePath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                imagePath,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 15),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 260,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Muddatli to’lov asosida',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '18:16',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4),
              Text(
                "You: i don't remember anything 😄",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
