import 'package:flutter/material.dart';
import 'package:maxxasisstantt/app/constant/app_image.dart';
import 'package:maxxasisstantt/view/ChatBotScreen.dart';
import 'package:maxxasisstantt/view/view_model/Screen3.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Screen2 extends StatelessWidget {
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    List<String> images = [
      AppImages.housekepping,
      AppImages.service,
      AppImages.stuff
    ];
    List<ServiceModel> services = [
      const ServiceModel(
          imageUrl: AppImages.housekepping, title: "HouseKeeping"),
      const ServiceModel(imageUrl: AppImages.service, title: "Oda Servisi"),
      const ServiceModel(imageUrl: AppImages.stuff, title: "Oda Malzemeleri"),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Image.asset(AppImages.passwordLogo),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListView.separated(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ServiceWidget(
                        imageUrl: images[index],
                        service: services[index],
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Screen3()));
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: images.length),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) {
          print(i);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ChatBotScreen()));
        },
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Home"),
            selectedColor: Colors.blue,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: const Icon(Icons.message),
            title: const Text("Likes"),
            selectedColor: Colors.blue,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: const Icon(Icons.phone),
            title: const Text("Search"),
            selectedColor: Colors.blue,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text("Profile"),
            selectedColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}

class ServiceWidget extends StatelessWidget {
  const ServiceWidget(
      {super.key,
      required this.imageUrl,
      required this.service,
      required this.onTap});
  final String imageUrl;
  final ServiceModel service;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 150,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  imageUrl,
                ),
                fit: BoxFit.cover),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Container(
              width: double.infinity,
              height: 50,
              color: Colors.black.withOpacity(0.4),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    service.title!,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                const SizedBox(
                    height: 8), // Başlık ile resim arasına boşluk ekledik
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceModel {
  final String? imageUrl;
  final String? title;

  const ServiceModel({this.imageUrl, this.title});
}
