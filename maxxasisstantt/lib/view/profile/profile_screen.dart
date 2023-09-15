import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maxxasisstantt/model/user_model.dart';
import 'package:maxxasisstantt/view/ChatPage.dart';
import 'package:maxxasisstantt/view/profile/profile_view_model.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(profileProvider).getMeInfo();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProfileViewModel profileViewModel = ref.watch(profileProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black),
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
      body: _body(profileViewModel),
    );
  }

  Widget _body(ProfileViewModel watch) {
    if (watch.isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    if (watch.userModel?.error != null) {
      return Center(
        child: Text('Error: ${watch.userModel?.error}'),
      );
    }
    return _bodyContent(watch.userModel!.data!);
  }

  Widget _bodyContent(UserModel userModel) {
    return Padding(
      padding: const EdgeInsets.all(16.0), // Daha fazla padding
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 24), // Daha fazla boşluk
            CircleAvatar(
              radius: 64, // Daha büyük avatar
              backgroundImage: AssetImage(
                "${userModel.profilePicUrl}",
              ),
            ),
            SizedBox(height: 16),
            Text(
              "${userModel.name ?? ""} ${userModel.lastName ?? ""}",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold), // Daha büyük ve kalın yazı tipi
            ),
            SizedBox(height: 24),
            _buildMenuItem(Icons.account_circle, 'My Account'),
            _buildMenuItem(Icons.notifications, 'Notification'),
            _buildMenuItem(Icons.storage, 'Storage'),
            _buildMenuItem(Icons.help, 'FAQ'),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // Daha belirgin bir düğme rengi
                ),
                onPressed: () {},
                child: Text('Log Out'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String label) {
    return InkWell(
      onTap: () {
        if (label == 'My Account') {
        } else if (label == 'Notification') {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => UserListScreen()),
          );
        } else if (label == 'Storage') {
        } else if (label == 'FAQ') {}
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16), // Daha fazla padding
        decoration: BoxDecoration(
          color: Colors.white, // Daha belirgin bir arka plan rengi
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 24, // Daha büyük ikonlar
            ),
            SizedBox(width: 16),
            Text(label, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
