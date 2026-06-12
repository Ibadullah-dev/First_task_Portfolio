import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import 'utils/app_colors.dart';
import 'animated_background.dart';
import 'widgets/glass_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _progressController;

  @override
  void initState() {
    super.initState();
    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..forward();
  }

  @override
  void dispose() {
    _progressController.dispose();
    super.dispose();
  }

  static const _skills = [
    {'name': 'Flutter & Dart', 'level': 0.82, 'color': Color(0xFF6C63FF)},
    {'name': 'Python', 'level': 0.75, 'color': Color(0xFF03DAC6)},
    {'name': 'Machine Learning', 'level': 0.60, 'color': Color(0xFFFF6584)},
    {'name': 'FastAPI', 'level': 0.70, 'color': Color(0xFFFFD700)},
    {'name': 'Firebase', 'level': 0.65, 'color': Color(0xFFFF9800)},
    {'name': 'REST APIs', 'level': 0.78, 'color': Color(0xFF4CAF50)},
    {'name': 'Git & GitHub', 'level': 0.80, 'color': Color(0xFFE91E63)},
  ];

  static const _experience = [
    {
      'title': 'Flutter Mobile App Development',
      'desc': 'Building production-grade apps with clean architecture',
      'icon': Icons.phone_android_rounded,
      'color': Color(0xFF6C63FF),
    },
    {
      'title': 'XPS Viewer & Converter Project',
      'desc': 'Flutter frontend + Python FastAPI backend integration',
      'icon': Icons.picture_as_pdf_rounded,
      'color': Color(0xFF03DAC6),
    },
    {
      'title': 'AI & Machine Learning Projects',
      'desc': 'Learning and building ML models with Python',
      'icon': Icons.psychology_rounded,
      'color': Color(0xFFFF6584),
    },
    {
      'title': 'E-Commerce Development',
      'desc': 'Full-featured shopping app with order management',
      'icon': Icons.shopping_bag_rounded,
      'color': Color(0xFFFFD700),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AnimatedBackground(
        child: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeInDown(
                  child: Text(
                    'My Profile',
                    style: GoogleFonts.poppins(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      foreground: Paint()
                        ..shader = AppColors.primaryGradient.createShader(
                          const Rect.fromLTWH(0, 0, 200, 40),
                        ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Profile Card
                FadeInUp(
                  delay: const Duration(milliseconds: 200),
                  child: GlassCard(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 72,
                              height: 72,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: AppColors.primaryGradient,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.primary.withOpacity(0.4),
                                    blurRadius: 20,
                                  ),
                                ],
                              ),
                              child: ClipOval(
                                child: Image.asset(
                                  'asset/images/image.jpeg',
                                  width: 72,
                                  height: 72,
                                  fit: BoxFit.cover,
                                
                          
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Ibad Ullah',
                                    style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'BS Software Engineering',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.secondary,
                                    ),
                                  ),
                                  Text(
                                    'Abasyn University Peshawar',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            _InfoChip(
                                Icons.school_rounded, '8th Semester', AppColors.primary),
                            const SizedBox(width: 8),
                            _InfoChip(
                                Icons.location_on_rounded, 'Peshawar, PK', AppColors.secondary),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Skills Section
                FadeInLeft(
                  delay: const Duration(milliseconds: 300),
                  child: _SectionHeader('Technical Skills', Icons.code_rounded),
                ),
                const SizedBox(height: 14),
                GlassCard(
                  child: Column(
                    children: List.generate(_skills.length, (i) {
                      final skill = _skills[i];
                      final level = skill['level'] as double;
                      final color = skill['color'] as Color;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: AnimatedBuilder(
                          animation: _progressController,
                          builder: (_, __) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      skill['name'] as String,
                                      style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      '${(level * _progressController.value * 100).toInt()}%',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: color,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                Stack(
                                  children: [
                                    Container(
                                      height: 6,
                                      decoration: BoxDecoration(
                                        color: AppColors.glassWhite,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    FractionallySizedBox(
                                      widthFactor:
                                          level * _progressController.value,
                                      child: Container(
                                        height: 6,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              color,
                                              color.withOpacity(0.5)
                                            ],
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color: color.withOpacity(0.4),
                                              blurRadius: 6,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(height: 24),

                // Experience
                FadeInLeft(
                  delay: const Duration(milliseconds: 400),
                  child: _SectionHeader('Experience', Icons.work_history_rounded),
                ),
                const SizedBox(height: 14),
                ...List.generate(_experience.length, (i) {
                  final exp = _experience[i];
                  return FadeInUp(
                    delay: Duration(milliseconds: 500 + i * 100),
                    child: GlassCard(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: (exp['color'] as Color).withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(exp['icon'] as IconData,
                                color: exp['color'] as Color, size: 22),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  exp['title'] as String,
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  exp['desc'] as String,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;
  const _SectionHeader(this.title, this.icon);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppColors.primary, size: 20),
        const SizedBox(width: 8),
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  const _InfoChip(this.icon, this.label, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 13),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}