import 'package:flutter/material.dart';
import 'package:frontend/screens/background_page_route.dart';
import 'package:frontend/screens/profile_screen.dart';
import 'package:frontend/services/google_auth_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _existingHouseholdController =
      TextEditingController();
  final TextEditingController _newHouseholdController = TextEditingController();
  final FocusNode _existingFocusNode = FocusNode();
  final FocusNode _newFocusNode = FocusNode();
  bool _isLoading = false;

  // Login with Google - authenticate and save the data into the database
  Future<void> signInWithGoogle() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // 1. Get the user and token from Google.
      final result = await GoogleAuthService.loginWithToken();
      
      if (result == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login canceled or failed')),
        );
        setState(() {
          _isLoading = false;
        });
        return;
      }

      final GoogleSignInAccount googleUser = result['user'];
      final String? idToken = result['idToken'];

      print('Authenticated with: ${googleUser.email}');
      
      if (idToken == null) {
        throw Exception('Could not get the ID token from Google');
      }
      
      print('ID token received: ${idToken.substring(0, 50)}...');

      // 2. Send the token to the backend
      final response = await http.post(
        Uri.parse('http://10.0.2.2:8000/auth/google'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'token': idToken}),
      );

      print('Status backend: ${response.statusCode}');
      print('Replied: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final jwtToken = data['access_token'];
        final userId = data['user_id'];
        final email = data['email'];
        final name = data['name'];
        
        print('Backend authentication succesfully! User ID: $userId');
        
        _navigateToProfileScreen(
          user: googleUser,
          token: jwtToken,
          email: email,
          name: name,
        );
      } else {
        final error = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Backend Error: ${error['detail']}')),
        );
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _navigateToProfileScreen({
    required GoogleSignInAccount user,
    required String token,
    required String email,
    required String name,
  }) {
    Navigator.pushReplacement(
      context,
      NoFlashPageRoute(
        builder: (context) => ProfileScreen(
          user: user,
          token: token,
          email: email,
          name: name,
          householdOption: _existingHouseholdController.text.isNotEmpty
              ? 'existing'
              : 'new',
          householdCode: _existingHouseholdController.text.isNotEmpty
              ? _existingHouseholdController.text
              : _newHouseholdController.text,
        ),
      ),
    );
  }

  // Pop-up message for Facebook button: (coming soon)
  void _facebookComingSoon() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Facebook Login'),
        content: const Text('This function is coming soon!'),
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
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Image.asset(
                    'assets/images/applogo.png',
                    width: 269.01,
                    fit: BoxFit.contain,
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
                  ),
                  const SizedBox(height: 200),
                  // Google button
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
                    onPressed: _isLoading ? null : signInWithGoogle,
                    child: _isLoading
                        ? const SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                            ),
                          )
                        : Row(
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
                  // Facebook button
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
                    onPressed: _facebookComingSoon,
                    
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