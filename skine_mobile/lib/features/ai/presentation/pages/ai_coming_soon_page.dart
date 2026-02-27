import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/glass_card.dart';

class AIComingSoonPage extends StatelessWidget {
  const AIComingSoonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(LucideIcons.arrowLeft, color: AppColors.textMain),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: GlassCard(
            borderRadius: 64,
            padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Abstract Background Elements
                Positioned(
                  top: -100,
                  right: -100,
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      color: AppColors.indigo.withOpacity(0.05),
                      shape: BoxShape.circle,
                    ),
                  ).animate(onPlay: (controller) => controller.repeat(reverse: true))
                    .scale(begin: const Offset(1, 1), end: const Offset(1.2, 1.2), duration: 8.seconds)
                    .blur(begin: const Offset(100, 100), end: const Offset(120, 120)),
                ),
                
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: AppColors.indigo,
                              shape: BoxShape.circle,
                            ),
                          ).animate(onPlay: (controller) => controller.repeat())
                            .scale(begin: const Offset(1, 1), end: const Offset(1.5, 1.5), duration: 1.seconds)
                            .fadeOut(),
                          const SizedBox(width: 12),
                          const Text(
                            'NEURAL NETWORK EXPANSION',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3,
                              color: AppColors.textDim,
                            ),
                          ),
                        ],
                      ),
                    ).animate().fadeIn().slideY(begin: 0.1),
                    const SizedBox(height: 48),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 56,
                          height: 1.1,
                          color: AppColors.textMain,
                        ),
                        children: const [
                          TextSpan(text: 'Artificial\n'),
                          TextSpan(
                            text: 'Intelligence',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: AppColors.accent,
                            ),
                          ),
                        ],
                      ),
                    ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1),
                    const SizedBox(height: 32),
                    const Text(
                      'We are engineering a revolutionary generative dermal model. Your clinical profile will soon be synthesized into predictive visualization protocols.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.textDim,
                        fontWeight: FontWeight.w300,
                        height: 1.6,
                      ),
                    ).animate().fadeIn(delay: 400.ms),
                    const SizedBox(height: 60),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withOpacity(0.3),
                            blurRadius: 30,
                            offset: const Offset(0, 15),
                          ),
                        ],
                      ),
                      child: Text(
                        'Coming Q3 2026',
                        style: GoogleFonts.serif(
                          fontSize: 24,
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                        ),
                      ),
                    ).animate().fadeIn(delay: 600.ms).scale(),
                    const SizedBox(height: 80),
                    _buildTechIndicators(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTechIndicators() {
    final indicators = ['Predictive Logic', 'Dermal Gen-AI', 'Bio-Symmetry'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: indicators.map((text) => Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Container(
                  height: 4,
                  width: double.infinity,
                  color: AppColors.border,
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: 0.6,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.indigo.withOpacity(0.4),
                      ),
                    ),
                  ),
                ),
              ).animate(onPlay: (controller) => controller.repeat())
                .shimmer(duration: 2.seconds),
              const SizedBox(height: 12),
              Text(
                text.toUpperCase(),
                style: const TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
        ),
      )).toList(),
    );
  }
}
