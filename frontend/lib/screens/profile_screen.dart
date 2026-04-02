
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:frontend/services/google_auth_service.dart';
import 'package:frontend/screens/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  final GoogleSignInAccount? user;
  final String householdOption;
  final String householdCode;

  const ProfileScreen({
    super.key,
    required this.user,
    required this.householdOption,
    required this.householdCode,
  });

  Future<void> _logout(BuildContext context) async {
    final success = await GoogleAuthService.logout();
    
    if (success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Logout failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () => _logout(context),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      ),
                      child: const Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              Center(
                child: Text(
                  'Play&Go',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth =1.5
                      ..color = const Color.fromARGB(255, 2, 0, 0),

                  ),
                ),
              ),
            ],
          ),
              
              const Spacer(),
              
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Select Your Profile',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth =1.5
                        ..color = const Color.fromARGB(255, 2, 0, 0),
                    ),
                  ),
                  const SizedBox(height: 100),
                  
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _ProfileCircle(
                              imageUrl: null,
                              onTap: () => _showDialog(context, 'Profile 1'),
                            ),
                            const SizedBox(width: 24),
                            _ProfileCircle(
                              imageUrl: null,
                              onTap: () => _showDialog(context, 'Profile 2'),
                            ),
                            const SizedBox(width: 24),
                            _ProfileCircle(
                              imageUrl: null,
                              onTap: () => _showDialog(context, 'Profile 3'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _ProfileCircle(
                              imageUrl: null,
                              onTap: () => _showDialog(context, 'Profile 4'),
                            ),
                            const SizedBox(width: 24),
                            _AddProfileCircle(
                              onTap: () => _showAddProfileDialog(context),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 100),
                  
                  ElevatedButton(
                    onPressed: () => _showEditProfileDialog(context),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 122, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      elevation: 8,
                      shadowColor: Colors.black
                    ),
                    child: const Text(
                      'Edit Your Profile',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 58),
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog(BuildContext context, String profileType) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Profile Selected'),
        content: Text(
          'Selected profile: $profileType\n\n'
          'Household: $householdOption\n'
          'Code: $householdCode'
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showAddProfileDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New Profile'),
        content: const Text('This feature is coming soon!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showEditProfileDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Profile'),
        content: const Text('This feature is coming soon!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

class _ProfileCircle extends StatelessWidget {
  final String? imageUrl;
  final VoidCallback onTap;

  const _ProfileCircle({
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color.fromARGB(0, 224, 224, 224),
          border: Border.all(
            color: Colors.grey[400]!,
            width: 2,
          ),
        ),
        child: imageUrl != null
            ? ClipOval(
                child: Image.network(
                  imageUrl!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.person, size: 60);
                  },
                ),
              )
            : const Icon(Icons.person, size: 60, color: Colors.grey),
      ),
    );
  }
}

class _AddProfileCircle extends StatelessWidget {
  final VoidCallback onTap;

  const _AddProfileCircle({
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color.fromARGB(0, 238, 238, 238),
          border: Border.all(
            color: Colors.grey[400]!,
            width: 2,
          ),
        ),
        child: const Icon(
          Icons.add,
          size: 60,
          color: Colors.grey,
        ),
      ),
    );
  }
}