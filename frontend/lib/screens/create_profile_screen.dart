import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class CreateProfileScreen extends StatefulWidget {
  final GoogleSignInAccount? user;
  final String householdOption;
  final String householdCode;
  final String token;
  final String email;
  final String name;

  const CreateProfileScreen({
    super.key,
    required this.user,
    required this.householdOption,
    required this.householdCode,
    required this.token,
    required this.email,
    required this.name,
  });

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  final TextEditingController _profileNameController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  String? _selectedAvatar;
  bool _isSaving = false;

  final List<Map<String, dynamic>> _avatars = [
    {'path': 'assets/images/Thor.png', 'name': 'Thor'},
    {'path': 'assets/images/Loki.png', 'name': 'Loki'},
    {'path': 'assets/images/LadyElf.png', 'name': 'Lady Elf'},
    {'path': 'assets/images/Grandma.png', 'name': 'Grandma'},
    {'path': 'assets/images/Grandpa.png', 'name': 'Grandpa'},
    {'path': 'assets/images/GirlElf.png', 'name': 'Girl Elf'},
  ];

  @override
  void dispose() {
    _profileNameController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> _saveProfile() async {
    FocusScope.of(context).unfocus();

    if (_profileNameController.text.trim().isEmpty || _selectedAvatar == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Complete all fields')),
      );
      return;
    }

    setState(() => _isSaving = true);

    final selectedAvatarData =
        _avatars.firstWhere((a) => a['path'] == _selectedAvatar);

    final newProfile = {
      'name': _profileNameController.text.trim(),
      'avatarPath': _selectedAvatar,
      'avatarName': selectedAvatarData['name'],
      'createdAt': DateTime.now(),
    };

    await Future.delayed(const Duration(milliseconds: 400));

    if (!mounted) return;

    Navigator.pop(context, newProfile);
  }

  void _cancel() {
    FocusScope.of(context).unfocus();
    Navigator.pop(context, null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              keyboardDismissBehavior:
                  ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  Text(
                    'Add Or Edit\nProfile',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.moiraiOne(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40),
                  _selectedAvatarCircle(),
                  const SizedBox(height: 40),
                  Text(
                    'CHOOSE AVATAR',
                    style: GoogleFonts.moiraiOne(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  _avatarGrid(),
                  const SizedBox(height: 50),
                  _nameField(),
                  const SizedBox(height: 80),
                ],
              ),
            ),
            Positioned(
              left: 16,
              top: 16,
              child: GestureDetector(
                onTap: _isSaving ? null : _cancel,
                child: _topButton('Cancel'),
              ),
            ),
            Positioned(
              right: 16,
              top: 16,
              child: GestureDetector(
                onTap: _isSaving ? null : _saveProfile,
                child: _topButton(_isSaving ? 'Saving...' : 'Save'),
              ),
            ),
            if (_isSaving)
              Container(
                color: Colors.black45,
                child: const Center(child: CircularProgressIndicator()),
              ),
          ],
        ),
      ),
    );
  }

  Widget _topButton(String text) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xFF283C7E),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      );

  Widget _selectedAvatarCircle() => Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: const Color.fromARGB(255, 161, 67, 67), width: 4),
        ),
        child: ClipOval(
          child: _selectedAvatar != null
              ? Image.asset(_selectedAvatar!, fit: BoxFit.cover)
              : const Icon(Icons.person, size: 60, color: Colors.white),
        ),
      );

  Widget _avatarGrid() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Wrap(
          spacing: 20,
          runSpacing: 20,
          alignment: WrapAlignment.center,
          children: _avatars.map(_buildAvatarOption).toList(),
        ),
      );

  Widget _nameField() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          height: 54,
          decoration: BoxDecoration(
            color: const Color(0x4CE6E6E6),
            borderRadius: BorderRadius.circular(14),
          ),
          child: TextField(
            controller: _profileNameController,
            focusNode: _focusNode,
            autofocus: true,
            decoration: const InputDecoration(
              hintText: 'Enter Profile Name',
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            ),
          ),
        ),
      );

  Widget _buildAvatarOption(Map<String, dynamic> avatar) {
    final isSelected = _selectedAvatar == avatar['path'];

    return GestureDetector(
      onTap: () => setState(() => _selectedAvatar = avatar['path']),
      child: Container(
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: isSelected ? 4 : 2,
            color: isSelected ? Colors.green : const Color(0xFFDBA8A8),
          ),
        ),
        child: ClipOval(
          child: Image.asset(avatar['path'], fit: BoxFit.cover),
        ),
      ),
    );
  }
}