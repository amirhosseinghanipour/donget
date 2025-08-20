import 'package:flutter/material.dart';
import 'constants/app_colors.dart';
import 'constants/app_dimensions.dart';
import 'models/user.dart';
import 'widgets/profile_header.dart';
import 'widgets/profile_card.dart';
import 'widgets/info_cards.dart';
import 'widgets/menu_items.dart';
import 'widgets/gauge_chart.dart';
import 'widgets/custom_navigation_bar.dart';
import 'widgets/custom_floating_action_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ProfilePage(),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.scaffoldBackground,
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // 0: Profile, 1: Friends, 2: Add Item, 3: Search, 4: Home
  int _currentIndex = 0;
  
  final User _user = User.demo();

  void _onNavItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _currentIndex,
        onNavItemTapped: _onNavItemTapped,
      ),
      body: Column(
        children: [
          const ProfileHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppDimensions.spacingXL),
              child: Column(
                children: [
                  ProfileCard(user: _user),
                  const SizedBox(height: AppDimensions.spacingL),
                  InfoCards(user: _user),
                  const SizedBox(height: AppDimensions.spacingXL),
                  const MenuItems(),
                  const SizedBox(height: AppDimensions.spacingXL),
                  const GaugeChart(
                    defiPercentage: 36.0,
                    ethereumPercentage: 64.0,
                  ),
                  const SizedBox(height: AppDimensions.spacingXXXL),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
