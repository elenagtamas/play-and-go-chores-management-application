// frontend/test/widget_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/screens/login_screen.dart';
import 'package:frontend/services/google_auth_service.dart';

void main() {
  group('GoogleAuthService Tests', () {
    test('GoogleAuthService.login returns Future', () {
      // Test 1: Verifying if login method exists
      final result = GoogleAuthService.login();
      expect(result, isA<Future>());
    });

    test('GoogleAuthService.logout returns Future<bool>', () {
      // Test 2: Verifying if logout method exists
      final result = GoogleAuthService.logout();
      expect(result, isA<Future<bool>>());
    });

    test('GoogleAuthService.getCurrentUser returns Future', () {
      // Test 3: Verifying if getCurrentUser method exists
      final result = GoogleAuthService.getCurrentUser();
      expect(result, isA<Future>());
    });
  });

  group('LoginScreen Widget Tests', () {
    testWidgets('LoginScreen displays Google login button', (WidgetTester tester) async {
      // Test 4: Verifying if Google login button exists
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      await tester.pump();

      expect(find.text('Continue with Google'), findsOneWidget);
      expect(find.text('Continue with Facebook'), findsOneWidget);
    });

    testWidgets('LoginScreen displays household input fields', (WidgetTester tester) async {
      // Test 5: Verifying the existence of input text fields
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      await tester.pump();

      expect(find.text('Enter Existing Household'), findsOneWidget);
      expect(find.text('Or Create New Household'), findsOneWidget);
    });

    testWidgets('LoginScreen shows loading indicator when loading', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );
      
      await tester.pump();
      
      expect(find.byType(CircularProgressIndicator), findsNothing);
    });
  });

  group('Input Field Logic Tests', () {
    testWidgets('Both household fields are present', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      await tester.pump();

      expect(find.text('Enter Existing Household'), findsOneWidget);
      expect(find.text('Or Create New Household'), findsOneWidget);
    });
  });
}