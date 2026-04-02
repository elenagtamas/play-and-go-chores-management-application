import 'package:flutter/material.dart';
import 'package:frontend/screens/profile_screen.dart';
import 'package:frontend/services/google_auth_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _existingHouseholdController =
      TextEditingController();

  final TextEditingController _newHouseholdController =
      TextEditingController();
  
  final FocusNode _existingFocusNode = FocusNode();
  final FocusNode _newFocusNode = FocusNode();

  final GoogleAuthService _authService = GoogleAuthService();

  Future<void> signIn() async {
    final user = await GoogleAuthService.login();

    if (user != null) {
      _navigate(user);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login failed')),
      );
    }
  }

  void _navigate(GoogleSignInAccount user) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileScreen(
          user: user,
          householdOption:
              _existingHouseholdController.text.isNotEmpty ? 'existing' : 'new',
          householdCode: _existingHouseholdController.text.isNotEmpty
              ? _existingHouseholdController.text
              : _newHouseholdController.text,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _existingFocusNode.dispose();
    _newFocusNode.dispose();
    _existingHouseholdController.dispose();
    _newHouseholdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const SizedBox(height: 40),

                  const Text(
                    'Manage Household Chores with Play&Go',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 100),

                  TextField(
                    controller: _existingHouseholdController,
                    focusNode: _existingFocusNode,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: 'Enter Existing Household',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onTap: () {
                      _existingFocusNode.requestFocus();
                    },
                  ),

                  const SizedBox(height: 20),

                  TextField(
                    controller: _newHouseholdController,
                    focusNode: _newFocusNode,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: 'Or Create New Household',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onTap: () {
                      _newFocusNode.requestFocus();
                    },
                  ),

                  const SizedBox(height: 300),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      minimumSize: const Size(double.infinity, 55),
                      elevation: 6,
                      shadowColor: Colors.black45,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: signIn,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ShaderMask(
                          shaderCallback: (bounds) {
                            return const LinearGradient(
                              colors: [
                                Color.fromARGB(255, 255, 17, 0),
                                Color.fromARGB(255, 255, 115, 0),
                                Color.fromARGB(255, 255, 230, 0),
                                Color.fromARGB(255, 87, 236, 216),
                                Color.fromARGB(255, 87, 236, 92),
                                Color.fromARGB(255, 0, 140, 255),
                                Color.fromARGB(255, 4, 0, 255),
                              ],
                              begin: Alignment(-1.0, -0.5),
                              end: Alignment(1.0, 0.5),
                            ).createShader(bounds);
                          },
                          child: const FaIcon(
                            FontAwesomeIcons.google,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text('Continue with Google'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      minimumSize: const Size(double.infinity, 55),
                      elevation: 6,
                      shadowColor: Colors.black45,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: signIn,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        FaIcon(
                          FontAwesomeIcons.facebook,
                          color: Color.fromARGB(255, 64, 124, 255),
                        ),
                        SizedBox(width: 12),
                        Text('Continue with Facebook'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}