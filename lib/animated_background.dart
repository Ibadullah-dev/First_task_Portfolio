import 'dart:math';
import 'package:flutter/material.dart';
import 'utils/app_colors.dart';


class AnimatedBackground extends StatefulWidget {
  final Widget child;
  const AnimatedBackground({super.key, required this.child});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with TickerProviderStateMixin {
  late AnimationController _orb1Controller;
  late AnimationController _orb2Controller;
  late AnimationController _orb3Controller;

  @override
  void initState() {
    super.initState();
    _orb1Controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat(reverse: true);

    _orb2Controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 11),
    )..repeat(reverse: true);

    _orb3Controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 14),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _orb1Controller.dispose();
    _orb2Controller.dispose();
    _orb3Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: AppColors.backgroundGradient,
          ),
        ),
        // Orb 1 - Purple
        AnimatedBuilder(
          animation: _orb1Controller,
          builder: (_, __) => Positioned(
            top: -100 + (_orb1Controller.value * 120),
            left: -80 + (_orb1Controller.value * 80),
            child: _buildOrb(200, const Color(0x4D6C63FF)),
          ),
        ),
        // Orb 2 - Teal
        AnimatedBuilder(
          animation: _orb2Controller,
          builder: (_, __) => Positioned(
            top: size.height * 0.3 + (_orb2Controller.value * 100),
            right: -60 + (_orb2Controller.value * 60),
            child: _buildOrb(180, const Color(0x3303DAC6)),
          ),
        ),
        // Orb 3 - Pink
        AnimatedBuilder(
          animation: _orb3Controller,
          builder: (_, __) => Positioned(
            bottom: -80 + (_orb3Controller.value * 80),
            left: size.width * 0.3 + (_orb3Controller.value * 50),
            child: _buildOrb(160, const Color(0x26FF6584)),
          ),
        ),
        // Floating dots
        ...List.generate(8, (i) => _FloatingDot(index: i)),
        widget.child,
      ],
    );
  }

  Widget _buildOrb(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.5),
            blurRadius: 60,
            spreadRadius: 20,
          ),
        ],
      ),
    );
  }
}

class _FloatingDot extends StatefulWidget {
  final int index;
  const _FloatingDot({required this.index});

  @override
  State<_FloatingDot> createState() => _FloatingDotState();
}

class _FloatingDotState extends State<_FloatingDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late double startX, startY;
  final _rand = Random();

  @override
  void initState() {
    super.initState();
    startX = _rand.nextDouble();
    startY = _rand.nextDouble();
    _ctrl = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4 + _rand.nextInt(6)),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: _ctrl,
      builder: (_, __) => Positioned(
        left: startX * size.width + (_ctrl.value * 30 - 15),
        top: startY * size.height + (_ctrl.value * 40 - 20),
        child: Container(
          width: 3,
          height: 3,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.15 + _ctrl.value * 0.25),
          ),
        ),
      ),
    );
  }
}