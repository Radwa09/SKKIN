import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/glass_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  _buildHeroSection(),
                  const SizedBox(height: 60),
                  _buildServiceGrid(context),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      floating: true,
      pinned: false,
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.border),
            ),
            child: const Icon(LucideIcons.sparkles, size: 20, color: AppColors.textMain),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'skinE',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 1.2,
                ),
              ),
              Text(
                'CLINICAL ELITE',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w800,
                  fontSize: 10,
                  color: AppColors.textDim,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(LucideIcons.layoutDashboard, color: AppColors.textMain),
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _buildHeroSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(LucideIcons.target, size: 12, color: AppColors.emerald),
              const SizedBox(width: 8),
              Text(
                'POWERED BY ADVANCED AI VISION',
                style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ).animate().fadeIn().slideX(),
        const SizedBox(height: 24),
        RichText(
          text: TextSpan(
            style: GoogleFonts.playfairDisplay(
              fontSize: 48,
              height: 1.1,
              color: AppColors.textMain,
            ),
            children: const [
              TextSpan(text: 'Elevate Your\n'),
              TextSpan(
                text: 'Dermal Profile.',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: AppColors.accent,
                ),
              ),
            ],
          ),
        ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1),
        const SizedBox(height: 32),
        ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: AspectRatio(
            aspectRatio: 3 / 4,
            child: Image.asset(
              'assets/images/aurora_serum.png',
              fit: BoxFit.cover,
            ),
          ),
        ).animate().scale(delay: 400.ms, curve: Curves.easeOutBack),
      ],
    );
  }

  Widget _buildServiceGrid(BuildContext context) {
    final services = [
      {'title': 'Scan', 'icon': LucideIcons.camera, 'color': AppColors.emerald, 'route': '/scan'},
      {'title': 'AI', 'icon': LucideIcons.brain, 'color': AppColors.indigo, 'route': '/ai'},
      {'title': 'Routine', 'icon': LucideIcons.droplet, 'color': Colors.blue, 'route': '/routine'},
      {'title': 'Clinic', 'icon': LucideIcons.stethoscope, 'color': Colors.purple, 'route': '/clinic'},
      {'title': 'Biometrics', 'icon': LucideIcons.fingerprint, 'color': Colors.orange, 'route': '/biometrics'},
      {'title': 'Tech', 'icon': LucideIcons.cpu, 'color': Colors.red, 'route': '/technology'},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.85,
      ),
      itemCount: services.length,
      itemBuilder: (context, index) {
        final service = services[index];
        return _ServiceCard(
          title: service['title'] as String,
          icon: service['icon'] as IconData,
          color: service['color'] as Color,
          onTap: () => context.push(service['route'] as String),
        ).animate().fadeIn(delay: (500 + index * 100).ms).scale();
      },
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _ServiceCard({
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: GlassCard(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(icon, color: color, size: 28),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      'EXPLORE',
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.2,
                        color: AppColors.accent,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(LucideIcons.arrowRight, size: 10, color: AppColors.accent),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
