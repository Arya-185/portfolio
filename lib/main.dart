import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyPortfolioLanding());
}

class MyPortfolioLanding extends StatelessWidget {
  const MyPortfolioLanding({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio Coming Soon',
      debugShowCheckedModeBanner: false,

      themeMode: ThemeMode.system,

      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFF3F4F6),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF10B981),
          surface: Colors.white,
          onSurface: Color(0xFF111827),
        ),
        useMaterial3: true,
      ),

      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF111827),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF10B981),
          surface: Color(0xFF1F2937),
          onSurface: Colors.white,
        ),
        useMaterial3: true,
      ),

      home: const PortfolioCountdownPage(),
    );
  }
}

class PortfolioCountdownPage extends StatefulWidget {
  const PortfolioCountdownPage({super.key});

  @override
  State<PortfolioCountdownPage> createState() => _PortfolioCountdownPageState();
}

class _PortfolioCountdownPageState extends State<PortfolioCountdownPage> {
  final DateTime _targetDate = DateTime(2026, 1, 7, 12);

  late Timer _timer;
  Duration _timeLeft = Duration.zero;

  @override
  void initState() {
    super.initState();
    _calculateTimeLeft();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _calculateTimeLeft();
    });
  }

  void _calculateTimeLeft() {
    final now = DateTime.now();
    final difference = _targetDate.difference(now);

    if (mounted) {
      setState(() {
        if (difference.isNegative) {
          _timeLeft = Duration.zero;
          _timer.cancel();
        } else {
          _timeLeft = difference;
        }
      });
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final bool isDesktop = screenSize.width > 800;

    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final Color textColor = isDarkMode ? Colors.white : const Color(0xFF1F2937);
    final Color subTextColor = isDarkMode ? Colors.white54 : Colors.black54;
    final Color gridColor = isDarkMode
        ? Colors.white.withValues(alpha: 0.05)
        : Colors.black.withValues(alpha: 0.05);

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(painter: GridPainter(color: gridColor)),
          ),

          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 40,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: isDarkMode
                          ? Colors.white.withValues(alpha: 0.1)
                          : Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFF10B981),
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF10B981).withValues(alpha: 0.3),
                          blurRadius: 20,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.person_rounded,
                      size: 50,
                      color: isDarkMode ? Colors.white : Colors.black54,
                    ),
                  ),

                  const SizedBox(height: 32),

                  Text(
                    "BUILDING MY\nDIGITAL HOME",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: isDesktop ? 56 : 36,
                      fontWeight: FontWeight.w900,
                      height: 1.1,
                      letterSpacing: 1.2,
                      color: textColor,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Text(
                    "I'm crafting a portfolio to showcase my work.\nLaunch is scheduled for:",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: subTextColor,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 48),

                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    alignment: WrapAlignment.center,
                    children: [
                      _buildTimerItem(_timeLeft.inDays, "Days", isDarkMode),
                      _buildTimerItem(
                        _timeLeft.inHours % 24,
                        "Hours",
                        isDarkMode,
                      ),
                      _buildTimerItem(
                        _timeLeft.inMinutes % 60,
                        "Minutes",
                        isDarkMode,
                      ),
                      _buildTimerItem(
                        _timeLeft.inSeconds % 60,
                        "Seconds",
                        isDarkMode,
                      ),
                    ],
                  ),

                  const SizedBox(height: 60),

                  Text(
                    "In the meantime, find me on:",
                    style: TextStyle(
                      color: subTextColor,
                      fontSize: 12,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialButton(Icons.code, "GitHub", isDarkMode),
                      const SizedBox(width: 16),
                      _buildSocialButton(Icons.link, "LinkedIn", isDarkMode),
                      const SizedBox(width: 16),
                      _buildSocialButton(
                        Icons.mail_outline,
                        "Email",
                        isDarkMode,
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  Text(
                    "© 2025 Arya Mehta",
                    style: TextStyle(
                      color: subTextColor.withValues(alpha: 0.3),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimerItem(int value, String label, bool isDark) {
    return Container(
      width: 90,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1F2937) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: isDark
            ? []
            : [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: 0.05)
              : Colors.black.withValues(alpha: 0.05),
        ),
      ),
      child: Column(
        children: [
          Text(
            value.toString().padLeft(2, '0'),
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFF10B981),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label.toUpperCase(),
            style: TextStyle(
              fontSize: 10,
              color: isDark ? Colors.white38 : Colors.black38,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, String label, bool isDark) {
    return InkWell(
      onTap: () {
        if (label == "GitHub") {
          launchUrl(
            Uri.parse("https://github.com/Arya-185"),
            browserConfiguration: BrowserConfiguration(showTitle: false),
          );
        } else if (label == "LinkedIn") {
          launchUrl(
            Uri.parse("https://www.linkedin.com/in/arya-a-mehta/"),
            browserConfiguration: BrowserConfiguration(showTitle: false),
          );
        } else if (label == "Email") {
          launchUrl(
            Uri.parse("mailto:mehtaarya18@gmail.com"),
            browserConfiguration: BrowserConfiguration(showTitle: false),
          );
        }
      },

      borderRadius: BorderRadius.circular(50),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isDark
              ? Colors.white.withValues(alpha: 0.05)
              : Colors.black.withValues(alpha: 0.05),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: isDark ? Colors.white70 : Colors.black54,
          size: 24,
        ),
      ),
    );
  }
}

class GridPainter extends CustomPainter {
  final Color color;

  GridPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;

    const double spacing = 40;

    for (double i = 0; i < size.width; i += spacing) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }

    for (double i = 0; i < size.height; i += spacing) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant GridPainter oldDelegate) => false;
}
