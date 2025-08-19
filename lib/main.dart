import 'package:flutter/material.dart';
import 'dart:math' as math;

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

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomNav(),
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
                Image.asset('assets/logo.png', width: 35, height: 35),
                const Text(
                  "Profile",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white),
                ),
                Image.asset('assets/Magnifer.png', width: 28, height: 28),
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
                                  children: const [
                                    SizedBox(height: 8.16),
                                    Text("Martin Hamilton",
                                        style: TextStyle(
                                            fontSize: 18, fontWeight: FontWeight.w900)),
                                    SizedBox(height: 4),
                                    Text("Martin.Hammilton1177@gmail.com",
                                        style: TextStyle(
                                          fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFFCCD1E0))),
                                  ],
                                ),
                              ),
                            ),
                            // decorative vectors
                            Positioned(
                              top: 0,
                              left: 19,
                              child: Image.asset('assets/left_vector.png'),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 17,
                              child: Image.asset('assets/right_vector_small.png'),
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
                                backgroundImage: AssetImage("assets/avatar.png"),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFF2F364E),
                                  shape: BoxShape.circle,
                                ),
                                padding: const EdgeInsets.all(1),
                                child: Image.asset('assets/edit.png', width: 30, height: 30),
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
                                    SizedBox(width: 8),
                                    Text("Dolphin",
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w900,
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
                                    fontWeight: FontWeight.w900,
                                    color: Color(0xFF2E354D),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          _infoCard(
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
                                    Image.asset('assets/copy.png', width: 16, height: 16),
                                    const SizedBox(width: 4),
                                    Text(
                                      "EQE13255",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 60),
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
                        const SizedBox(height: 36),

                        Padding(
                          padding: const EdgeInsets.only(top: 80, bottom: 32.68, left: 65.12, right:65.12),
                          child: SizedBox(
                            child: CustomPaint(
                              painter: GaugeChartPainter(),
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Text("64% Ethereum",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                    SizedBox(height: 6),
                                    Text("36% DeFi",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
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
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF2F364E),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.only(left: 8, right: 16, top: 7, bottom: 8),
      child: Row(
        children: [
          _menuIconFor(title),
          const SizedBox(width: 16),
          Expanded(
              child: Text(title,
                  style: const TextStyle(
                      color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700))),
          if (title == 'Change Password' || title == 'Sign Out')
            Image.asset('assets/arrow-right.png', width: 16, height: 16),
        ],
      ),
    );
  }

  static Widget _menuIconFor(String title) {
    switch (title) {
      case 'Change Password':
        return Image.asset('assets/pass.png', width: 44, height: 44);
      case 'Sign Out':
        return Image.asset('assets/signout.png', width: 44, height: 44);
      default:
        return const SizedBox(width: 44, height: 44);
    }
  }

  static Widget _buildBottomNav() {
    return BottomAppBar(
      color: const Color(0xFF2F364E),
      child: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _NavItemAsset(asset: 'assets/user_circle.png', label: 'Profile'),
            const SizedBox(width: 16),
            _NavItemAsset(asset: 'assets/users.png', label: 'Friends'),
            const SizedBox(width: 16),
            _NavMainButton(),
            const SizedBox(width: 16),
            _NavItemAsset(asset: 'assets/search.png', label: 'Search'),
            const SizedBox(width: 16),
            _NavItemAsset(asset: 'assets/Home.png', label: 'Home'),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _NavItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.white),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}

class _NavItemAsset extends StatelessWidget {
  final String asset;
  final String label;

  const _NavItemAsset({required this.asset, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Image.asset(asset, width: 22, height: 22),
        ),
        const SizedBox(height: 4),
        Text(
          label, 
          style: const TextStyle(
            color: Color(0xFFA7B0CC), 
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _NavMainButton extends StatelessWidget {
  const _NavMainButton();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF2F364E), width: 4),
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            backgroundColor: Color(0xFF23B58A),
            radius: 20,
            child: Image.asset('assets/NavBar Main Button.png', width: 32, height: 32),
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Add Item', 
          style: TextStyle(
            color: Color(0xFFA7B0CC), 
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class GaugeChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = 20.0;
    final radius = size.width / 2 - strokeWidth;

    final center = Offset(size.width / 2, size.height / 2);

    final bgPaint = Paint()
      ..color = const Color(0xFF20263A)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        math.pi,
        math.pi,
        false,
        bgPaint);

    final defiPaint = Paint()
      ..color = const Color(0xFF5467FF)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        math.pi,
        math.pi * 0.36,
        false,
        defiPaint);

    final ethPaint = Paint()
      ..color = const Color(0xFFF7C42C)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        math.pi + math.pi * 0.36,
        math.pi * 0.64,
        false,
        ethPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
