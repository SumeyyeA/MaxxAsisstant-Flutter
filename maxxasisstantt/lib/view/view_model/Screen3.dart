import 'package:flutter/material.dart';
import 'package:maxxasisstantt/view/view_model/Screen4.dart';

class Screen3 extends StatelessWidget {
  List<CustomModel> liste = [
    CustomModel(
      title: 'Rahatsız Etmeyiniz',
      icon: Icons.back_hand,
      icon2: Icons.arrow_forward,
    ),
    CustomModel(
      title: 'Odamı Temizleyin',
      icon: Icons.spa,
      icon2: Icons.arrow_forward,
    ),
    CustomModel(
      title: 'Bebek Yatağı',
      icon: Icons.bedroom_child,
      icon2: Icons.arrow_forward,
    ),
    CustomModel(
      title: 'Nevresim Değişimi',
      icon: Icons.bed,
      icon2: Icons.arrow_forward,
    ),
    CustomModel(
      title: 'Ekstra Yatak',
      icon: Icons.bedroom_parent,
      icon2: Icons.arrow_forward,
    ),
    CustomModel(
      title: 'Saç Kurutma Makinası',
      icon: Icons.air,
      icon2: Icons.arrow_forward,
    ),
    CustomModel(
      title: 'Kasa',
      icon: Icons.propane_tank,
      icon2: Icons.arrow_forward,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Housekeeping',
          style: TextStyle(color: Colors.black),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return CustomButton(
                      text: liste[index].title ?? "",
                      icon: liste[index].icon ?? Icons.abc,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Screen4(model: liste[index])));
                      },
                      icon2: liste[index].icon2 ?? Icons.abc);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: liste.length)

            // Diğer butonlar burada sıralanacak
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  final IconData icon2;

  const CustomButton({
    required this.text,
    required this.icon,
    required this.onTap,
    required this.icon2,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        primary: Colors.white,
      ),
      child: Row(
        children: [
          /*Image.asset(
            'assets/logo.png', // Logo resminin yolu
            width: 40,
            height: 40,
          ),*/
          Icon(
            icon,
            size: 24,
            color: Colors.blue,
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(fontSize: 18, color: Colors.black),
          ),
          const Spacer(),
          Icon(
            icon2,
            size: 24,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}

class CustomModel {
  String? title;
  IconData? icon;
  IconData? icon2;

  CustomModel({this.icon, this.title, this.icon2});
}
