import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'utils/app_colors.dart';
import 'widgets/glass_card.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen>
    with SingleTickerProviderStateMixin {
  int? _expandedIndex;

  static const _projects = [
    {
      'title': 'XPS File Viewer & Converter',
      'overview':
          'A Flutter and Python-based application that allows users to open, preview, read, edit, and convert XPS documents into PDF format.',
      'icon': Icons.picture_as_pdf_rounded,
      'color': Color(0xFF6C63FF),
      'status': 'Completed',
      'technologies': ['Flutter', 'Dart', 'Python', 'FastAPI', 'REST APIs'],
      'features': [
        'Open XPS files',
        'Preview document pages',
        'Convert XPS to PDF',
        'Edit document content',
        'Share converted files',
        'User-friendly interface',
      ],
      'role': [
        'Flutter Frontend Development',
        'API Integration',
        'UI/UX Design',
        'File Management System',
      ],
    },
    {
      'title': 'SmartPocket – Personal Expense Tracker',
      'overview':
          'A personal finance management application that helps users track income, expenses, savings, and monthly budgets.',
      'icon': Icons.account_balance_wallet_rounded,
      'color': Color(0xFF03DAC6),
      'status': 'Completed',
      'technologies': ['Flutter', 'SQLite', 'Firebase'],
      'features': [
        'Income Tracking',
        'Expense Tracking',
        'Budget Management',
        'Monthly Reports',
        'Expense Categories',
        'Financial Analytics',
      ],
      'role': [
        'Mobile App Development',
        'Database Design',
        'Dashboard Implementation',
      ],
    },
    {
      'title': 'Life Admin AI',
      'overview':
          'An AI-powered productivity assistant that helps users manage important life tasks, documents, subscriptions, reminders, and deadlines.',
      'icon': Icons.psychology_rounded,
      'color': Color(0xFFFF6584),
      'status': 'In Progress',
      'technologies': ['Flutter', 'Python', 'Artificial Intelligence', 'Machine Learning'],
      'features': [
        'Document Expiry Reminders',
        'Bill Payment Alerts',
        'Subscription Tracking',
        'Smart Notifications',
        'AI Recommendations',
        'Task Management',
      ],
      'role': [
        'Product Design',
        'Flutter Development',
        'AI Integration Planning',
      ],
    },
    {
      'title': 'AI Food Scanner',
      'overview':
          'A smart mobile application that uses Artificial Intelligence to analyze food items and provide nutritional information.',
      'icon': Icons.restaurant_rounded,
      'color': Color(0xFFFFD700),
      'status': 'In Progress',
      'technologies': ['Flutter', 'Python', 'Machine Learning', 'Computer Vision'],
      'features': [
        'Food Recognition',
        'Calorie Estimation',
        'Nutrition Analysis',
        'Healthy Food Suggestions',
        'Meal Tracking',
        'Diet Recommendations',
      ],
      'role': [
        'Mobile Application Development',
        'AI Model Integration',
        'User Interface Design',
      ],
    },
    {
      'title': 'Mansoor Silver & Jewellery',
      'overview':
          'A complete e-commerce solution developed for Mansoor Silver & Jewellery to sell silver products online.',
      'icon': Icons.shopping_bag_rounded,
      'color': Color(0xFF4CAF50),
      'status': 'Completed',
      'technologies': ['React', 'TypeScript', 'Express.js', 'Tailwind CSS'],
      'features': [
        'Product Management',
        'Shopping Cart',
        'Order Tracking',
        'WhatsApp Integration',
        'Customer Accounts',
        'Admin Dashboard',
      ],
      'role': [
        'System Planning',
        'UI/UX Design',
        'Business Requirements Analysis',
      ],
    },
    {
      'title': 'AI Assistant for Visually Impaired',
      'overview':
          'An AI-powered assistant designed to help visually impaired individuals navigate their surroundings safely.',
      'icon': Icons.visibility_off_rounded,
      'color': Color(0xFFE91E63),
      'status': 'Future',
      'technologies': ['Flutter', 'Python', 'Computer Vision', 'Artificial Intelligence'],
      'features': [
        'Object Detection',
        'Voice Guidance',
        'Path Navigation',
        'Real-Time Audio Feedback',
        'Emergency Assistance',
      ],
      'role': [
        'Product Concept',
        'AI Architecture Planning',
        'Accessibility Design',
      ],
    },
  ];

  Color _statusColor(String status) {
    switch (status) {
      case 'Completed':
        return const Color(0xFF4CAF50);
      case 'In Progress':
        return const Color(0xFFFFD700);
      case 'Future':
        return const Color(0xFFE91E63);
      default:
        return AppColors.textSecondary;
    }
  }

  IconData _statusIcon(String status) {
    switch (status) {
      case 'Completed':
        return Icons.check_circle_rounded;
      case 'In Progress':
        return Icons.pending_rounded;
      case 'Future':
        return Icons.rocket_launch_rounded;
      default:
        return Icons.circle_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 20, 24, 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              'My Projects',
              style: GoogleFonts.poppins(
                fontSize: 26,
                fontWeight: FontWeight.w700,
                foreground: Paint()
                  ..shader = AppColors.primaryGradient.createShader(
                    const Rect.fromLTWH(0, 0, 200, 40),
                  ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${_projects.length} projects · tap to expand',
              style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
            ),
            const SizedBox(height: 20),

            // Stats row
            Row(
              children: [
                _MiniStat(
                  label: 'Completed',
                  count: _projects
                      .where((p) => p['status'] == 'Completed')
                      .length,
                  color: const Color(0xFF4CAF50),
                ),
                const SizedBox(width: 10),
                _MiniStat(
                  label: 'In Progress',
                  count: _projects
                      .where((p) => p['status'] == 'In Progress')
                      .length,
                  color: const Color(0xFFFFD700),
                ),
                const SizedBox(width: 10),
                _MiniStat(
                  label: 'Upcoming',
                  count:
                      _projects.where((p) => p['status'] == 'Future').length,
                  color: const Color(0xFFE91E63),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Project cards
            ...List.generate(_projects.length, (i) {
              final project = _projects[i];
              final isExpanded = _expandedIndex == i;
              final color = project['color'] as Color;
              final status = project['status'] as String;
              final features = project['features'] as List<String>;
              final technologies = project['technologies'] as List<String>;
              final role = project['role'] as List<String>;

              return Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _expandedIndex = isExpanded ? null : i;
                    });
                  },
                  child: GlassCard(
                    padding: EdgeInsets.zero,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Card header
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: color.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Icon(
                                  project['icon'] as IconData,
                                  color: color,
                                  size: 24,
                                ),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      project['title'] as String,
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Icon(
                                          _statusIcon(status),
                                          color: _statusColor(status),
                                          size: 13,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          status,
                                          style: TextStyle(
                                            color: _statusColor(status),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              AnimatedRotation(
                                turns: isExpanded ? 0.5 : 0,
                                duration: const Duration(milliseconds: 250),
                                child: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Expandable content
                        AnimatedSize(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          child: isExpanded
                              ? Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      16, 0, 16, 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Divider(
                                          color:
                                              Colors.white.withOpacity(0.08)),
                                      const SizedBox(height: 12),

                                      // Overview
                                      _SubHeader('Overview', color),
                                      const SizedBox(height: 6),
                                      Text(
                                        project['overview'] as String,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: AppColors.textSecondary,
                                          height: 1.6,
                                        ),
                                      ),
                                      const SizedBox(height: 14),

                                      // Technologies
                                      _SubHeader('Technologies', color),
                                      const SizedBox(height: 8),
                                      Wrap(
                                        spacing: 6,
                                        runSpacing: 6,
                                        children: technologies
                                            .map((tech) => Container(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                          horizontal: 10,
                                                          vertical: 5),
                                                  decoration: BoxDecoration(
                                                    color: color
                                                        .withOpacity(0.12),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    border: Border.all(
                                                      color: color
                                                          .withOpacity(0.3),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    tech,
                                                    style: TextStyle(
                                                      color: color,
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ))
                                            .toList(),
                                      ),
                                      const SizedBox(height: 14),

                                      // Features
                                      _SubHeader('Features', color),
                                      const SizedBox(height: 8),
                                      ...features.map(
                                        (f) => Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 4),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 6,
                                                height: 6,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: color,
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              Expanded(
                                                child: Text(
                                                  f,
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color:
                                                        AppColors.textSecondary,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 14),

                                      // My Role
                                      _SubHeader('My Role', color),
                                      const SizedBox(height: 8),
                                      ...role.map(
                                        (r) => Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 4),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.arrow_right_rounded,
                                                color: color,
                                                size: 18,
                                              ),
                                              const SizedBox(width: 4),
                                              Expanded(
                                                child: Text(
                                                  r,
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color:
                                                        AppColors.textSecondary,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class _SubHeader extends StatelessWidget {
  final String title;
  final Color color;
  const _SubHeader(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.poppins(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: color,
      ),
    );
  }
}

class _MiniStat extends StatelessWidget {
  final String label;
  final int count;
  final Color color;
  const _MiniStat({
    required this.label,
    required this.count,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.25)),
        ),
        child: Column(
          children: [
            Text(
              '$count',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}