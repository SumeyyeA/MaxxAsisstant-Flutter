import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:maxxasisstantt/view/ChatBotScreen.dart';
import 'package:maxxasisstantt/view/Screen1.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

final List<String> imgList = [
  'https://lirp.cdn-website.com/11191c87/dms3rep/multi/opt/lobby10-1920w.jpg',
  'https://lirp.cdn-website.com/11191c87/dms3rep/multi/opt/lobby13-1920w.jpg',
  'https://lirp.cdn-website.com/11191c87/dms3rep/multi/opt/building1-feded8e1-1920w.jpg',
  'https://lirp.cdn-website.com/11191c87/dms3rep/multi/opt/LimakEurasiaLogov2-1920w-1920w.png',
];
final List<String> imgList1 = [
  'https://lirp.cdn-website.com/11191c87/dms3rep/multi/opt/restaurant4-1920w.jpg',
  'https://lirp.cdn-website.com/11191c87/dms3rep/multi/opt/restaurant6-1920w.jpg',
  'https://lirp.cdn-website.com/11191c87/dms3rep/multi/opt/meeting11-1920w.jpg',
  'https://lirp.cdn-website.com/11191c87/dms3rep/multi/opt/lobby10-1920w.jpg',
  'https://lirp.cdn-website.com/11191c87/dms3rep/multi/opt/lobby13-1920w.jpg',
];
final List<String> imgList2 = [
  'https://lirp.cdn-website.com/11191c87/dms3rep/multi/opt/pexels-tamas-marton-4616611-2880w.jpg',
  'https://lirp.cdn-website.com/11191c87/dms3rep/multi/opt/stone+bridge+skopje-2880w.jpg',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
];

final List<String> sliderTitles = [
  'MENU',
  'RESTAURANTS&BARS',
  'ENTERTAINMENT',
];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _widgetOptions = [
    Screen1(),
    ChatBotScreen(),
    Screen1(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Home',
          style: TextStyle(fontFamily: 'Open Sans', color: Colors.black),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSliderWithTitle(imgList, sliderTitles[0]),
            _buildSliderWithTitle(imgList1, sliderTitles[1]),
            _buildSliderWithTitle(imgList2, sliderTitles[2]),
          ],
        ),
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) {
          setState(() {
            _currentIndex = i; // Update the selected index.
          });
          // Navigate to the corresponding screen from _widgetOptions
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => _widgetOptions[i],
            ),
          );
        },
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Home"),
            selectedColor: Colors.grey[850],
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: const Icon(Icons.message),
            title: const Text("Message"),
            selectedColor: Colors.grey[850],
          ),

          /// Bot
          SalomonBottomBarItem(
            icon: const Icon(Icons.room_service),
            title: const Text("Bot"),
            selectedColor: Colors.grey[850],
          ),
        ],
      ),
    );
  }

  Widget _buildSliderWithTitle(List<String> imgList, String sliderTitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
              16, 18, 16, 18), // Alt ve üst boşluk eklemek için
          child: Text(
            sliderTitle,
            style: TextStyle(
              color: Colors.teal[200]!,
              fontFamily: 'Open Sans',
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        _buildCarouselSlider(imgList),
      ],
    );
  }

  Widget _buildCarouselSlider(List<String> imgList) {
    final List<Widget> imageSliders = imgList
        .map((item) => GestureDetector(
              onTap: () {
                // Slider'a tıklama işlemi burada yapılabilir.
              },
              child: Container(
                child: Container(
                  margin: EdgeInsets.all(4.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      child: Stack(
                        children: <Widget>[
                          Image.network(item, fit: BoxFit.cover, width: 1000.0),
                        ],
                      )),
                ),
              ),
            ))
        .toList();

    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
      ),
      items: imageSliders,
    );
  }
}
