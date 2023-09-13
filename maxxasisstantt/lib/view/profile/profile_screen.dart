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
          'Profil',
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
    //body şişmesin diye ayrı bir widget oluşturduk
    if (watch.isLoading) {
      return const Center(
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
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 16),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                "${userModel.profilePicUrl}", // Avatar görselinin yolu
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "${userModel.name ?? ""} ${userModel.lastName ?? ""}",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const SizedBox(height: 16),
            _buildMenuItem(Icons.account_circle, 'My Account'),
            _buildMenuItem(Icons.notifications, 'Notification'),
            _buildMenuItem(Icons.storage, 'Storage'),
            _buildMenuItem(Icons.help, 'FAQ'),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // Background color
                ),
                onPressed: () {},
                child: const Text('Log Out'),
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
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 16),
            Text(label),
          ],
        ),
      ),
    );
  }
}
