import 'package:flutter/material.dart';
import 'package:maxxasisstantt/app/constant/app_image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PasswordScreen(),
    );
  }
}

class PasswordScreen extends StatefulWidget {
  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  bool _showNumberInput = false;
  bool _showPasswordInput = false;

  void _showNumberInputField() {
    setState(() {
      _showNumberInput = true;
    });
  }

  void _showPasswordInputField() {
    setState(() {
      _showPasswordInput = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    AppImages.splashbBackgrond,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Image.asset(AppImages.passwordLogo),
                    const SizedBox(height: 24),
                    if (_showPasswordInput)
                      Container(
                        width: 233.63746643066406,
                        height: 51.00110626220703,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(92.50138092041016),
                          border: Border.all(width: 3),
                        ),
                        child: const Center(
                          child: TextField(
                            autofocus: true,
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Misafir Şifrenizi Giriniz",
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                            ),
                          ),
                        ),
                      ),
                    const SizedBox(height: 24),
                    if (_showNumberInput)
                      Container(
                        width: 300,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 3),
                        ),
                        child: const TextField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText: "Numara giriniz",
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                          ),
                        ),
                      ),
                    Spacer(),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 18),
                child: Container(
                  width: size.width * 0.55,
                  height: 41.69230651855469,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 3),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      _showPasswordInputField();
                    },
                    child: Text("Giriş Yap"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
