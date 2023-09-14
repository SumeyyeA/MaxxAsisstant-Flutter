import 'package:flutter/material.dart';
import 'package:maxxasisstantt/app/constant/app_image.dart';
import 'package:maxxasisstantt/view/Screen2.dart';
import 'package:maxxasisstantt/view/home.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

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
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.12),

                  // Butonun yüksekliğini belirler
                  minimumSize:
                      Size(double.infinity, 0), // Butonun genişliğini belirler
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10), // Butonun köşe yuvarlatması
                  ),
                  primary: Colors.white,
                  // Butonun rengi beyaz
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Screen2()));
                },
                child: const Text(
                  'Assistants',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      vertical:
                          screenHeight * 0.12), // Butonun yüksekliğini belirler
                  minimumSize:
                      Size(double.infinity, 0), // Butonun genişliğini belirler
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10), // Butonun köşe yuvarlatması
                  ),
                  primary: Colors.white, // Butonun rengi beyaz
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Text(
                  'Guests',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
