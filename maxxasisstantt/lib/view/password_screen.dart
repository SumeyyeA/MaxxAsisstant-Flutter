import 'package:flutter/material.dart';
import 'package:maxxasisstantt/app/constant/app_image.dart';
import 'package:maxxasisstantt/view/Screen1.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:maxxasisstantt/provider/password_provider.dart';
import 'package:passcode_screen/passcode_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => password_provider(),
      child: MaterialApp(
        home: PasswordScreen(),
      ),
    );
  }
}

class PasswordScreen extends StatefulWidget {
  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
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
                    Pinput(
                      defaultPinTheme: PinTheme(
                        width: 56,
                        height: 56,
                        textStyle: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(30, 60, 87, 1),
                            fontWeight: FontWeight.w600),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromRGBO(234, 239, 243, 1)),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      focusedPinTheme: PinTheme(
                        width: 56,
                        height: 56,
                        textStyle: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(30, 60, 87, 1),
                            fontWeight: FontWeight.w600),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromRGBO(114, 178, 238, 1)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      submittedPinTheme: PinTheme(
                        width: 56,
                        height: 56,
                        textStyle: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(30, 60, 87, 1),
                            fontWeight: FontWeight.w600),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromRGBO(234, 239, 243, 1)),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (s) {
                        return s == '2222' ? null : 'Pin is incorrect';
                      },
                      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                      showCursor: true,
                      onCompleted: (pin) => print(pin),
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Screen1()));
                    },
                    child: Text("Kodu Onayla"),
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
