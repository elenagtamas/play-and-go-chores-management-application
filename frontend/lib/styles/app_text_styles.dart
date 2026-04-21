import 'package:flutter/material.dart';

class AppTextStyles {
  // Font families
  static const String moiraiOne = 'Moirai One';
  static const String arial = 'Arial';
  static const String mongolianBaiti = 'Mongolian Baiti';
  static const String calibri = 'Calibri';
  static const String lilitaOne = 'Lilita One';

  // Titles
  // Play&Go Title

  static TextStyle get playAndGoTitle => const TextStyle(
    color: Color(0xFF737373),
    fontSize: 30,
    fontFamily: moiraiOne,
    fontWeight: FontWeight.w400,
    shadows: [Shadow(offset: Offset(7, 7), blurRadius: 5, color: Color(0x40000000))],
  );

  // Main Title
  static TextStyle get mainTitle => const TextStyle(
    color: Colors.black,
    fontSize: 24,
    fontFamily: moiraiOne,
    fontWeight: FontWeight.w400,
    shadows: [Shadow(offset: Offset(7, 7), blurRadius: 5, color: Color(0x40000000))],
  );

  // Section Title (30px)
  static TextStyle get sectionTitle => const TextStyle(
    color: Colors.black,
    fontSize: 30,
    fontFamily: moiraiOne,
    fontWeight: FontWeight.w400,
    shadows: [Shadow(offset: Offset(7, 7), blurRadius: 5, color: Color(0x40000000))],
  );

  // Subtitle (24px)
  static TextStyle get subtitle => const TextStyle(
    color: Colors.black,
    fontSize: 24,
    fontFamily: moiraiOne,
    fontWeight: FontWeight.w400,
    shadows: [Shadow(offset: Offset(7, 7), blurRadius: 5, color: Color(0x40000000))],
  );
  
  // Add Or Edit Profile Title
  static TextStyle get addEditProfileTitle => const TextStyle(
    color: Colors.black,
    fontSize: 30,
    fontFamily: moiraiOne,
    fontWeight: FontWeight.w400,
    shadows: [Shadow(offset: Offset(7, 7), blurRadius: 5, color: Color(0x40000000))],
  );
  
  // Choose Avatar Title
  static TextStyle get chooseAvatarTitle => const TextStyle(
    color: Colors.black,
    fontSize: 24,
    fontFamily: moiraiOne,
    fontWeight: FontWeight.w400,
    shadows: [Shadow(offset: Offset(7, 7), blurRadius: 5, color: Color(0x40000000))],
  );
  
  // Select Room Title
  static TextStyle get selectRoomTitle => const TextStyle(
    color: Colors.black,
    fontSize: 24,
    fontFamily: moiraiOne,
    fontWeight: FontWeight.w400,
    shadows: [Shadow(offset: Offset(7, 7), blurRadius: 5, color: Color(0x40000000))],
  );
  
  // Room Title
  static TextStyle get roomTitle => const TextStyle(
    color: Colors.black,
    fontSize: 24,
    fontFamily: moiraiOne,
    fontWeight: FontWeight.w400,
    shadows: [Shadow(offset: Offset(7, 7), blurRadius: 5, color: Color(0x40000000))],
  );
  
  // Section Header (Due Today, Completed)
  static TextStyle get sectionHeader => const TextStyle(
    color: Colors.black,
    fontSize: 24,
    fontFamily: moiraiOne,
    fontWeight: FontWeight.w400,
    shadows: [Shadow(offset: Offset(7, 7), blurRadius: 5, color: Color(0x40000000))],
  );
  
  // Text fiedls and inputs
  // Input Field Text

  static TextStyle get inputFieldText => const TextStyle(
    color: Color(0xFF434343),
    fontSize: 20,
    fontFamily: arial,
    fontWeight: FontWeight.w400,
  );
  
  // Profile Name Field Hint
  static TextStyle get profileNameHint => const TextStyle(
    color: Color(0xFF434343),
    fontSize: 20,
    fontFamily: arial,
    fontWeight: FontWeight.w400,
  );
  
  // Hint Text
  static TextStyle get hintText => const TextStyle(
    color: Color(0xFF434343),
    fontSize: 16,
    fontFamily: arial,
    fontWeight: FontWeight.w400,
  );
  
  // Buttons
  // Button Text - White

  static TextStyle get buttonTextWhite => const TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontFamily: arial,
    fontWeight: FontWeight.w400,
  );
  
  // Button Text - Black
  static TextStyle get buttonTextBlack => const TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontFamily: arial,
    fontWeight: FontWeight.w400,
  );
  
  // Action Text (Save/Cancel)
  static TextStyle get actionText => const TextStyle(
    color: Color(0xFF283C7E),
    fontSize: 16,
    fontFamily: arial,
    fontWeight: FontWeight.w400,
  );
  
  // Back Button Text
  static TextStyle get backButtonText => const TextStyle(
    color: Color(0xFF283C7E),
    fontSize: 16,
    fontFamily: arial,
    fontWeight: FontWeight.w400,
  );
  
  // Logout Text
  static TextStyle get logoutText => const TextStyle(
    color: Color(0xFF283C7E),
    fontSize: 16,
    fontFamily: arial,
    fontWeight: FontWeight.w400,
  );
  
  // Add to List Button Text
  static TextStyle get addToListText => const TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontFamily: arial,
    fontWeight: FontWeight.w400,
  );
  
  // Home screen
  // Welcome Text

  static TextStyle get welcomeText => const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  
  // Household Code Text
  static TextStyle get householdCodeText => const TextStyle(
    fontSize: 14,
    color: Color(0xFF283C7E),
    fontWeight: FontWeight.w500,
  );
  
  // Button Label Large
  static TextStyle get buttonLabelLarge => const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  
  // Button Subtitle
  static TextStyle get buttonSubtitle => const TextStyle(
    fontSize: 14,
    color: Colors.white70,
  );
  
  // Quick Action Label
  static TextStyle get quickActionLabel => const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
  
  // Day Number Text
  static TextStyle get dayNumberText => const TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  
  // Month Text
  static TextStyle get monthText => const TextStyle(
    fontSize: 19,
    color: Color.fromARGB(255, 58, 58, 58),
  );
  
  // Decoratives
  // Decorative Letters (W, I, T, H)

  static TextStyle get decorativeLetter => const TextStyle(
    color: Colors.black,
    fontSize: 24,
    fontFamily: moiraiOne,
    fontWeight: FontWeight.w400,
  );
  
  // Plus Sign
  static TextStyle get plusSign => const TextStyle(
    color: Colors.black,
    fontSize: 96,
    fontFamily: mongolianBaiti,
    fontWeight: FontWeight.w400,
  );
  
  // Profiles
  // Profile Label

  static TextStyle get profileLabel => const TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontFamily: arial,
    fontWeight: FontWeight.w500,
  );
  
  // Room Name Text
  static TextStyle get roomNameText => const TextStyle(
    color: Colors.black,
    fontSize: 17,
    fontFamily: moiraiOne,
    fontWeight: FontWeight.w400,
  );
  
  // Chores
  // Chore Item Text

  static TextStyle get choreItemText => const TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontFamily: arial,
    fontWeight: FontWeight.w400,
    shadows: [Shadow(offset: Offset(0, 4), blurRadius: 4, color: Color(0x40000000))],
  );
  
  // Task Title (for activity screen)
  static TextStyle get taskTitle => const TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontFamily: calibri,
    fontWeight: FontWeight.w400,
    shadows: [Shadow(offset: Offset(7, 7), blurRadius: 5, color: Color(0x40000000))],
  );
  
  // Calendar
  // Calendar Date Text

  static TextStyle get calendarDateText => const TextStyle(
    color: Colors.black,
    fontSize: 26,
    fontFamily: calibri,
    fontWeight: FontWeight.w400,
  );
  
  // Day Letter Text (M, T, W, T, F, S, S)
  static TextStyle get dayLetterText => const TextStyle(
    color: Colors.white,
    fontSize: 40,
    fontFamily: lilitaOne,
    fontWeight: FontWeight.w400,
  );
  
  // Small Day Letter Text
  static TextStyle get smallDayLetterText => const TextStyle(
    color: Color(0xFFFFF7F7),
    fontSize: 33,
    fontFamily: lilitaOne,
    fontWeight: FontWeight.w400,
  );
  
  // Date Text
  static TextStyle get dateText => const TextStyle(
    color: Colors.black,
    fontSize: 22,
    fontFamily: calibri,
    fontWeight: FontWeight.w400,
  );
  
  // Rewards
  // Points/Reward Text
  
  static TextStyle get pointsText => const TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontFamily: calibri,
    fontWeight: FontWeight.w400,
  );
  
  // Progress Percentage
  static TextStyle get progressPercentage => const TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontFamily: calibri,
    fontWeight: FontWeight.w400,
  );
}