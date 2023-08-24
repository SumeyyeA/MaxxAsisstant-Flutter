import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:maxxasisstantt/app/constant/app_image.dart';
import 'package:maxxasisstantt/view/password_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _simulateNavigation();
  }

  void _simulateNavigation() async {
    await Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => PasswordScreen()),
      );
    }); // 3 saniye bekleme
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 312,
              height: 312,
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  image: AssetImage(AppImages.splashLogo),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 24),
            SpinKitWave(color: Colors.white, size: 30),
          ],
        ),
      ),
    );
  }
}
