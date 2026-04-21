import 'package:flutter/material.dart';
import 'package:frontend/screens/background_page_route.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:frontend/services/google_auth_service.dart';
import 'package:frontend/screens/login_screen.dart';
import 'package:frontend/screens/home_screen.dart';
import 'package:frontend/screens/create_profile_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  final GoogleSignInAccount? user;
  final String householdOption;
  final String householdCode;
  final String token;
  final String email;
  final String name;

  const ProfileScreen({
    super.key,
    required this.user,
    required this.householdOption,
    required this.householdCode,
    required this.token,
    required this.email,
    required this.name,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<Map<String, dynamic>> _customProfiles = [];

  @override
  void initState() {
    super.initState();
  }

  Future<void> _logout(BuildContext context) async {
    final success = await GoogleAuthService.logout();

    if (success && mounted) {
      Navigator.pushReplacement(
        context,
        NoFlashPageRoute(builder: (context) => const LoginScreen()),
      );
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Logout failed')),
      );
    }
  }

  void _navigateToHomeWithProfile(BuildContext context, String assetImagePath) {
    Navigator.push(
      context,
      NoFlashPageRoute(
        builder: (context) => HomeScreen(profileImagePath: assetImagePath),
      ),
    );
  }

  Future<void> _navigateToCreateProfile() async {
    final result = await Navigator.of(context, rootNavigator: true).push<Map<String, dynamic>>(
      NoFlashPageRoute(
        builder: (context) => CreateProfileScreen(
          user: widget.user,
          householdOption: widget.householdOption,
          householdCode: widget.householdCode,
          token: widget.token,
          email: widget.email,
          name: widget.name,
        ),
      ),
    );

    if (result != null && mounted) {
      setState(() {
        _customProfiles.add(result);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Profile "${result['name']}" created successfully!'),
        ),
      );
    }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Logout
            Positioned(
              top: 16,
              right: 16,
              child: TextButton(
                onPressed: () => _logout(context),
                child: const Text('Logout'),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 80),

                  Text(
                    'Household\n${widget.householdCode}',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.moiraiOne(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      shadows: [
                        Shadow(
                          offset: Offset(3, 3),
                          blurRadius: 6,
                          color: Colors.black.withOpacity(0.3),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 200),

                  Text(
                    'Select Your Profile',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.moiraiOne(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      shadows: [
                        Shadow(
                          offset: Offset(3, 3),
                          blurRadius: 6,
                          color: Colors.black.withOpacity(0.3),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      children: [
                        // ROW 1
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _ProfileWithLabel(
                              assetImagePath: 'assets/images/claire.png',
                              label: 'Claire',
                              onTap: () => _navigateToHomeWithProfile(
                                context,
                                'assets/images/claire.png',
                              ),
                            ),
                            const SizedBox(width: 24),
                            _ProfileWithLabel(
                              assetImagePath: 'assets/images/dennis.png',
                              label: 'Dennis',
                              onTap: () => _navigateToHomeWithProfile(
                                context,
                                'assets/images/dennis.png',
                              ),
                            ),
                            const SizedBox(width: 24),
                            _ProfileWithLabel(
                              assetImagePath: 'assets/images/john.png',
                              label: 'John',
                              onTap: () => _navigateToHomeWithProfile(
                                context,
                                'assets/images/john.png',
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _ProfileWithLabel(
                              assetImagePath: 'assets/images/lilith.png',
                              label: 'Lilith',
                              onTap: () => _navigateToHomeWithProfile(
                                context,
                                'assets/images/lilith.png',
                              ),
                            ),

                            const SizedBox(width: 24),

                            ..._customProfiles.map((profile) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 24),
                                child: _ProfileWithLabel(
                                  assetImagePath: profile['avatarPath'],
                                  label: profile['name'],
                                  onTap: () => _navigateToHomeWithProfile(
                                    context,
                                    profile['avatarPath'],
                                  ),
                                ),
                              );
                            }),

                            _AddProfileWithLabel(
                              label: 'Add profile',
                              onTap: _navigateToCreateProfile,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 60),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      minimumSize: const Size(200, 55),
                      elevation: 6,
                      shadowColor: Colors.black45,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () => _showEditProfileDialog(context),
                    child: const Text('Edit Profiles'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileWithLabel extends StatelessWidget {
  final String assetImagePath;
  final String label;
  final VoidCallback onTap;

  const _ProfileWithLabel({
    required this.assetImagePath,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color.fromARGB(255, 161, 67, 67), width: 3),
            ),
            child: ClipOval(
              child: Image.asset(assetImagePath, fit: BoxFit.cover),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: GoogleFonts.moiraiOne(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            shadows: [
              Shadow(
                offset: Offset(4, 4),
                blurRadius: 5,
                color: Colors.black.withOpacity(0.2),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _AddProfileWithLabel extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _AddProfileWithLabel({
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color.fromARGB(255, 161, 67, 67), width: 3),
            ),
            child: const Icon(Icons.add, size: 70, color: Colors.black),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: GoogleFonts.moiraiOne(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            shadows: [
              Shadow(
                offset: Offset(4, 4),
                blurRadius: 5,
                color: Colors.black.withOpacity(0.2),
              ),
            ],
          ),
        ),
      ],
    );
  }
}