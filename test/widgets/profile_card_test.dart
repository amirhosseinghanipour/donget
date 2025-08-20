import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:donget/models/user.dart';
import 'package:donget/widgets/profile_card.dart';

void main() {
  group('ProfileCard', () {
    late User testUser;

    setUp(() {
      testUser = const User(
        uid: 'TEST123',
        name: 'Test User',
        email: 'test@example.com',
        package: 'Test Package',
        expiryDate: '2025-12-31',
      );
    });

    testWidgets('displays user name and email', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProfileCard(user: testUser),
          ),
        ),
      );

      expect(find.text('Test User'), findsOneWidget);
      expect(find.text('test@example.com'), findsOneWidget);
    });

    testWidgets('renders without crashing', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProfileCard(user: testUser),
          ),
        ),
      );

      expect(find.byType(ProfileCard), findsOneWidget);
    });
  });
} 