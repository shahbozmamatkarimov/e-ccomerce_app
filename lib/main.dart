import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const menuIcon = 'assets/aside/menu.svg';

void main() {
  runApp(const MyApp());
}

String selectedPage = '';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    // GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    double screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          titleSpacing: 0,
          leadingWidth: 72,
          leading: Builder(
            builder: (context) => InkWell(
              child: Center(
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
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
          title: Row(
            children: [
              SizedBox(
                height: 60,
                child: Container(
                  width: screenWidth > 780 ? 363 : screenWidth - 72,
                  height: 36,
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  color: const Color(0xFF0D0F23),
                  child: SearchBar(
                    padding: const MaterialStatePropertyAll<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 16.0)),
                    hintText: "Search $screenWidth",
                    backgroundColor: MaterialStateProperty.all<Color?>(
                      const Color(0xFFFFFFFF),
                    ),
                    onTap: () {},
                    onChanged: (_) {},
                    leading: const Icon(Icons.search),
                  ),
                ),
              )
            ],
          ),
        ),
        drawer: Drawer(
          width: 290,
          backgroundColor: const Color(0xFF0D0F23),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                height: 170,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: const BoxDecoration(
                  color: Color(0xFF111536),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              "assets/images/home.png",
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SvgPicture.asset(
                          "assets/aside/light.svg",
                          width: 25,
                          height: 25,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "John Doe",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "+1 (234) 567 89 01",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        SvgPicture.asset(
                          "assets/aside/arrow.svg",
                          width: 25,
                          height: 25,
                          fit: BoxFit.cover,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const DrawerTitle(
                  imagePath: "assets/aside/phone.svg", title: "Calls"),
              const DrawerTitle(
                  imagePath: "assets/aside/history.svg", title: "History"),
              const DrawerTitle(
                  imagePath: "assets/aside/heart.svg", title: "Favorites"),
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
              width: screenWidth > 780 ? 363 : screenWidth - 72,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              color: const Color(0xFF0D0F23),
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

class DrawerTitle extends StatelessWidget {
  final String imagePath;
  final String title;

  const DrawerTitle({
    super.key,
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      hoverColor: const Color(0xFF111536),
      leading: SvgPicture.asset(
        imagePath,
        height: 25,
        width: 25,
      ),
      title: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 4),
        child: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        // setState(() {
        //   selectedPage = 'Settings';
        // });
      },
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
    double screenWidth = MediaQuery.of(context).size.width;
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SizedBox(
                  width: screenWidth > 780 ? 260 : screenWidth - 175,
                  child: const Row(
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
