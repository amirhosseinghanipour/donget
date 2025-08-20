import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;
import 'constants/app_icons.dart';

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
        scaffoldBackgroundColor: const Color(0xFF141B30),
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
  
  final String userUID = 'EQE13255';
  final String userName = 'Martin Hamilton';
  final String userEmail = 'Martin.Hammilton1177@gmail.com';

  void _onNavItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomAppBar(),
      body: Column(
        children: [
          // profile titlebar
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF2F364E),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.only(top: 48, left: 16, right: 18, bottom: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppIcons.logo, width: 35, height: 35),
                const Text(
                  "Profile",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(14),
                    splashColor: const Color(0xFF5467FF).withOpacity(0.3),
                    highlightColor: const Color(0xFF5467FF).withOpacity(0.2),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Image.asset(AppIcons.magnifier, width: 28, height: 28),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // profile card
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(top: 50),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2F364E),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Stack(
                          children: [
                            // content
                            Padding(
                              padding: const EdgeInsets.only(top: 60, bottom: 20),
                              child: Center(
                                child: Column(
                                  children: [
                                    const SizedBox(height: 8.16),
                                    Text(userName,
                                        style: const TextStyle(
                                            fontSize: 18, fontWeight: FontWeight.w900)),
                                    const SizedBox(height: 4),
                                    Text(userEmail,
                                        style: const TextStyle(
                                          fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFFCCD1E0))),
                                  ],
                                ),
                              ),
                            ),
                            // decorative vectors
                            Positioned(
                              top: 0,
                              left: 19,
                              child: Image.asset(AppIcons.leftVector),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 17,
                              child: Image.asset(AppIcons.rightVectorSmall),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xFF2F364E),
                                  width: 8,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: const CircleAvatar(
                                radius: 45,
                                backgroundImage: AssetImage(AppIcons.avatar),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {},
                                  borderRadius: BorderRadius.circular(20),
                                  splashColor: const Color(0xFF5467FF).withOpacity(0.3),
                                  highlightColor: const Color(0xFF5467FF).withOpacity(0.2),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF2F364E),
                                      shape: BoxShape.circle,
                                    ),
                                    padding: const EdgeInsets.all(1),
                                    child: Image.asset(AppIcons.edit, width: 32, height: 32),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // info cards
                  SizedBox(
                    height: 46,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          _infoCard(
                            bg: const Color(0xFFFCCF65),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Packages",
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF2E354D))),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.circle, size: 6, color: Color(0xFF2E354D)),
                                    SizedBox(width: 6),
                                    Text("Dolphin",
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xFF2E354D))),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          _infoCard(
                            bg: const Color(0xFF33DE7B),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Expires On",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF2E354D),
                                  ),
                                ),
                                Text(
                                  "30 November 2025",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF2E354D),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () async {
                                await Clipboard.setData(ClipboardData(text: userUID));
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'UID copied to clipboard: $userUID',
                                        style: const TextStyle(color: Colors.white),
                                      ),
                                      duration: const Duration(seconds: 2),
                                      backgroundColor: const Color(0xFF5467FF),
                                      behavior: SnackBarBehavior.floating,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  );
                                }
                              },
                              borderRadius: BorderRadius.circular(10),
                              splashColor: Colors.white.withOpacity(0.2),
                              highlightColor: Colors.white.withOpacity(0.1),
                              child: _infoCard(
                                bg: const Color(0xFF5467FF),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "UID (Referral Code)",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.asset(AppIcons.copy, width: 16, height: 16),
                                        const SizedBox(width: 4),
                                        Text(
                                          userUID,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // change password
                  _buildMenuItem(Icons.lock_outline, "Change Password"),
                  const SizedBox(height: 14),

                  // sign out
                  _buildMenuItem(Icons.logout, "Sign Out"),

                  const SizedBox(height: 16),

                  // gauge chart
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFF262E45),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: EdgeInsets.zero,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: const Text("Defi to Ethereum Ratio",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 16)),
                        ),
                        const SizedBox(height: 90),

                        Center(
                          child: Builder(
                            builder: (context) {
                              const double defiPercentage = 36.0;
                              const double ethereumPercentage = 64.0;
                              
                              return Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  SizedBox(
                                    width: 267.37,
                                    height: 100,
                                    child: CustomPaint(
                                      painter: GaugeChartPainter(
                                        defiPercentage: defiPercentage,
                                        ethereumPercentage: ethereumPercentage,
                                      ),
                                      size: const Size(267.37, 100),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 35,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text("${ethereumPercentage.toInt()}%",
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 18,
                                                    color: Color(0xFFFAFAFA))),
                                            const SizedBox(width: 4),
                                            Container(
                                              padding: const EdgeInsets.only(left: 6, right: 10),
                                              decoration: BoxDecoration(
                                                color: const Color(0xFF20263A),
                                                borderRadius: BorderRadius.circular(26.21),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Container(
                                                    width: 17.47,
                                                    height: 17.47,
                                                    decoration: BoxDecoration(
                                                      color: const Color(0xFFF7C42C),
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: const Color(0xFF262E45),
                                                        width: 2.18,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 4),
                                                  const Text("Ethereum",
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.w700,
                                                          fontSize: 16,
                                                          color: Colors.white)),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 6),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text("${defiPercentage.toInt()}%",
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 18,
                                                    color: Color(0xFFFAFAFA))),
                                            const SizedBox(width: 4),
                                            Container(
                                              padding: const EdgeInsets.only(left: 6, right: 10),
                                              decoration: BoxDecoration(
                                                color: const Color(0xFF20263A),
                                                borderRadius: BorderRadius.circular(26.21),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Container(
                                                    width: 17.47,
                                                    height: 17.47,
                                                    decoration: BoxDecoration(
                                                      color: const Color(0xFF5467FF),
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: const Color(0xFF262E45),
                                                        width: 2.18,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 4),
                                                  const Text("DeFi",
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.w700,
                                                          fontSize: 16,
                                                          color: Colors.white)),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 38.21),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  static Widget _infoCard({required Color bg, required Widget child}) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: child,
    );
  }

  static Widget _buildMenuItem(IconData icon, String title) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(16),
        splashColor: const Color(0xFF5467FF).withOpacity(0.2),
        highlightColor: const Color(0xFF5467FF).withOpacity(0.1),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF2F364E),
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.only(left: 8, right: 16, top: 7, bottom: 8),
          child: Row(
            children: [
              _menuIconFor(title),
              const SizedBox(width: 12),
              Expanded(
                  child: Text(title,
                      style: const TextStyle(
                          color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700))),
              if (title == 'Change Password' || title == 'Sign Out')
                Image.asset(AppIcons.arrowRight, width: 16, height: 16),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _menuIconFor(String title) {
    switch (title) {
      case 'Change Password':
        return Image.asset(AppIcons.password, width: 44, height: 44);
      case 'Sign Out':
        return Image.asset(AppIcons.signOut, width: 44, height: 44);
      default:
        return const SizedBox(width: 44, height: 44);
    }
  }

  Widget _buildBottomAppBar() {
    return BottomAppBar(
      color: const Color(0xFF2F364E),
      shape: const CustomNotchedShape(),
      child: SizedBox(
        height: 80,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _buildNavItem(0, AppIcons.profile, 'Profile'),
            ),
            Expanded(
              child: _buildNavItem(1, AppIcons.friends, 'Friends'),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 28),
                  const Text(
                    'Add Item',
                    style: TextStyle(
                      color: Color(0xFFA7B0CC),
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: _buildNavItem(3, AppIcons.search, 'Search'),
            ),
            Expanded(
              child: _buildNavItem(4, AppIcons.home, 'Home'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String asset, String label) {
    final isActive = _currentIndex == index;
    return InkWell(
      onTap: () => _onNavItemTapped(index),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              asset,
              width: 22,
              height: 22,
              color: isActive ? Colors.white : const Color(0xFFA7B0CC),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                color: isActive ? Colors.white : const Color(0xFFA7B0CC),
                fontSize: 11,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return Transform.translate(
      offset: const Offset(0, 12),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF2F364E),
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(4),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(20),
            splashColor: const Color(0xFF23B58A).withOpacity(0.3),
            highlightColor: const Color(0xFF23B58A).withOpacity(0.2),
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xFF23B58A),
                shape: BoxShape.circle,
              ),
                             child: Image.asset(
                 AppIcons.navBarMainButton,
                 width: 40,
                 height: 40,
                 fit: BoxFit.contain,
               ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomNotchedShape extends NotchedShape {
  const CustomNotchedShape();

  @override
  Path getOuterPath(Rect host, Rect? guest) {
    if (guest == null || !host.overlaps(guest)) {
      return Path()..addRect(host);
    }

    final fabRadius = guest.width / 4.0;
    // inward curve width
    final notchWidth = fabRadius * 2;
    // top of the curve
    final notchDepth = fabRadius;
    final center = guest.center;

    final path = Path()..moveTo(host.left, host.top);

    // left straight part before curve
    path.lineTo(center.dx - notchWidth * 1.5, host.top);

    // left curve inward
    path.cubicTo(
      center.dx - notchWidth * 0.6, host.top,
      center.dx - notchWidth * 0.8, host.top - notchDepth,
      center.dx, host.top - notchDepth,
    );

    // right curve
    path.cubicTo(
      center.dx + notchWidth * 0.8, host.top - notchDepth,
      center.dx + notchWidth * 0.6, host.top,
      center.dx + notchWidth * 1.5, host.top,
    );

    // rest of nav bar
    path.lineTo(host.right, host.top);
    path.lineTo(host.right, host.bottom);
    path.lineTo(host.left, host.bottom);

    path.close();
    return path;
  }
}

class GaugeChartPainter extends CustomPainter {
  final double defiPercentage;
  final double ethereumPercentage;
  
  GaugeChartPainter({
    required this.defiPercentage,
    required this.ethereumPercentage,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = 20.0;
    final radius = size.width / 2 - strokeWidth;
    final gapSize = 15.0;
    
    // inward offset
    final backgroundOffset = 6.0;

    final center = Offset(size.width / 2, size.height / 2);

    final bgPaint = Paint()
      ..color = const Color(0xFF20263A)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius - backgroundOffset),
        math.pi + 0.05,
        math.pi - 0.1,
        false,
        bgPaint);

    // gap in radians
    final gapRadians = (gapSize / radius) * 2;
    
    // total available space excluding gaps
    final totalPercentage = defiPercentage + ethereumPercentage;
    final availableRadians = math.pi - gapRadians;
    
    // segment sizes
    final defiRadians = (defiPercentage / totalPercentage) * availableRadians;
    final ethRadians = (ethereumPercentage / totalPercentage) * availableRadians;

    final defiPaint = Paint()
      ..color = const Color(0xFF5467FF)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        math.pi,
        defiRadians,
        false,
        defiPaint);

    final ethPaint = Paint()
      ..color = const Color(0xFFF7C42C)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        math.pi + defiRadians + gapRadians,
        ethRadians,
        false,
        ethPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
