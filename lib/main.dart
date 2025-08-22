import 'package:flutter/material.dart';
import 'constants/constants.dart';
import 'models/user.dart';
import 'widgets/widgets.dart';

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
  final GlobalKey<GaugeChartState> _gaugeChartKey =
      GlobalKey<GaugeChartState>();

  void _onNavItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Restart gauge chart animation when profile is selected
    if (index == 0 && _gaugeChartKey.currentState != null) {
      _gaugeChartKey.currentState!.restartAnimation();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFloatingActionButton(onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _currentIndex,
        onNavItemTapped: _onNavItemTapped,
      ),
      body: Column(
        children: [
          const Header(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppDimensions.spacingXL),
              child: _buildPageContent(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageContent() {
    switch (_currentIndex) {
      case 0: // Profile
        return Column(
          children: [
            ProfileCard(user: _user),
            const SizedBox(height: AppDimensions.spacingL),
            InfoCards(user: _user),
            const SizedBox(height: AppDimensions.spacingXL),
            const MenuItems(),
            const SizedBox(height: AppDimensions.spacingXL),
            GaugeChart(
              defiPercentage: 36.0,
              ethereumPercentage: 64.0,
              shouldAnimate: true,
              key: _gaugeChartKey,
            ),
            const SizedBox(height: AppDimensions.spacingXXXL),
          ],
        );
      case 1: // Friends
        return const Center(
          child: Text(
            'Friends Page',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        );
      case 2: // Add Item
        return const Center(
          child: Text(
            'Add Item Page',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        );
      case 3: // Search
        return const Center(
          child: Text(
            'Search Page',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        );
      case 4: // Home
        return const Center(
          child: Text(
            'Home Page',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
