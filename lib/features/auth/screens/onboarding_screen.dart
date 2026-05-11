import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/router/route_names.dart';
import '../../../core/storage/secure_storage.dart';

const _slides = [
  {
    'emoji': '🧱',
    'title': 'Track Every Expense',
    'body': 'Record all construction costs — materials, labor, equipment, permits — in one place with receipt photos.',
    'color': '1B3A5C',
  },
  {
    'emoji': '📊',
    'title': 'Live Budget Control',
    'body': 'See exactly where your money goes with real-time charts, category breakdowns, and instant over-budget alerts.',
    'color': '0F2236',
  },
  {
    'emoji': '📤',
    'title': 'Share Instantly',
    'body': 'Share expense reports via WhatsApp, generate guest links, or email PDF summaries to owners and investors.',
    'color': '1A3356',
  },
];

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  final _pageController = PageController();
  int _current = 0;
  late AnimationController _animCtrl;

  @override
  void initState() {
    super.initState();
    _animCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..forward();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animCtrl.dispose();
    super.dispose();
  }

  void _next() {
    if (_current < _slides.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      _finish();
    }
  }

  Future<void> _finish() async {
    await ref.read(secureStorageProvider).setOnboarded();
    if (mounted) context.go(Routes.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (i) => setState(() => _current = i),
            itemCount: _slides.length,
            itemBuilder: (_, i) => _OnboardingPage(slide: _slides[i]),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.fromLTRB(
                AppDim.pageHPadding,
                AppDim.xl,
                AppDim.pageHPadding,
                MediaQuery.of(context).padding.bottom + AppDim.xl,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.4)],
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(_slides.length, (i) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: _current == i ? 24 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: _current == i ? AppColors.accent : Colors.white.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    )),
                  ),
                  const SizedBox(height: AppDim.xl),
                  SizedBox(
                    width: double.infinity,
                    height: AppDim.btnXl,
                    child: ElevatedButton(
                      onPressed: _next,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.accent,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppDim.radiusMd),
                        ),
                        textStyle: AppText.btnLg,
                      ),
                      child: Text(_current == _slides.length - 1 ? 'Get Started' : 'Next'),
                    ),
                  ),
                  const SizedBox(height: AppDim.md),
                  if (_current < _slides.length - 1)
                    TextButton(
                      onPressed: _finish,
                      child: Text(
                        'Skip',
                        style: AppText.bodyMd.copyWith(color: Colors.white.withOpacity(0.6)),
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
}

class _OnboardingPage extends StatelessWidget {
  final Map<String, String> slide;
  const _OnboardingPage({required this.slide});

  @override
  Widget build(BuildContext context) {
    final color = Color(int.parse('FF${slide['color']}', radix: 16));

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: color,
      child: Stack(
        children: [
          Positioned.fill(child: CustomPaint(painter: _GeometricPainter())),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.15,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.accent.withOpacity(0.08),
                ),
                child: Center(
                  child: Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.accent.withOpacity(0.12),
                    ),
                    child: Center(
                      child: Text(
                        slide['emoji']!,
                        style: const TextStyle(fontSize: 64),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: AppDim.pageHPadding,
            right: AppDim.pageHPadding,
            top: MediaQuery.of(context).size.height * 0.55,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.accent,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: AppDim.base),
                Text(
                  slide['title']!,
                  style: const TextStyle(
                    fontFamily: 'Sora',
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: AppDim.md),
                Text(
                  slide['body']!,
                  style: TextStyle(
                    fontFamily: 'Sora',
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withOpacity(0.65),
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _GeometricPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.04)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    for (double i = -size.height; i < size.width + size.height; i += 60) {
      canvas.drawLine(Offset(i, 0), Offset(i + size.height, size.height), paint);
    }
  }
  @override
  bool shouldRepaint(_) => false;
}
