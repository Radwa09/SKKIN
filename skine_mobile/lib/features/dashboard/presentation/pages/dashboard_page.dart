import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/glass_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(context),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildWelcomeHeader(),
                  const SizedBox(height: 32),
                  _buildStatCards(),
                  const SizedBox(height: 32),
                  _buildAnalysisCTA(),
                  const SizedBox(height: 48),
                  _buildHistorySection(),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      floating: true,
      leading: IconButton(
        icon: const Icon(LucideIcons.arrowLeft, color: AppColors.textMain),
        onPressed: () => Navigator.of(context).pop(),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(LucideIcons.bell, color: AppColors.textMain),
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _buildWelcomeHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'WELCOME BACK,',
          style: AppTheme.darkTheme.textTheme.labelSmall,
        ).animate().fadeIn().slideX(),
        const SizedBox(height: 8),
        Text(
          'Radwa.',
          style: AppTheme.darkTheme.textTheme.displayLarge?.copyWith(
            fontFamily: GoogleFonts.playfairDisplay().fontFamily,
            fontStyle: FontStyle.italic,
          ),
        ).animate().fadeIn(delay: 200.ms).slideX(),
      ],
    );
  }

  Widget _buildStatCards() {
    return Row(
      children: [
        Expanded(child: _StatCard(title: 'Analyses', value: '12', icon: LucideIcons.activity)),
        const SizedBox(width: 16),
        Expanded(child: _StatCard(title: 'Score', value: '84', icon: LucideIcons.star, color: AppColors.emerald)),
        const SizedBox(width: 16),
        Expanded(child: _StatCard(title: 'Days', value: '45', icon: LucideIcons.calendar)),
      ],
    ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.1);
  }

  Widget _buildAnalysisCTA() {
    return GlassCard(
      color: AppColors.primary.withOpacity(0.2),
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ready for your next analysis?',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  '14 days since your last comprehensive dermal scan.',
                  style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 13),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(LucideIcons.plus, color: AppColors.background),
          ),
        ],
      ),
    ).animate().scale(delay: 600.ms);
  }

  Widget _buildHistorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('ANALYSIS HISTORY', style: AppTheme.darkTheme.textTheme.labelSmall),
            const Icon(LucideIcons.chevronRight, size: 16, color: AppColors.textMuted),
          ],
        ),
        const SizedBox(height: 24),
        _HistoryItem(date: 'Feb 15, 2026', score: '84', status: 'Stable'),
        _HistoryItem(date: 'Feb 01, 2026', score: '79', status: 'Improving'),
        _HistoryItem(date: 'Jan 15, 2026', score: '81', status: 'Stable'),
      ],
    ).animate().fadeIn(delay: 800.ms);
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color? color;

  const _StatCard({required this.title, required this.value, required this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: color ?? AppColors.textDim),
          const SizedBox(height: 16),
          Text(
            value,
            style: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.bold, color: color ?? Colors.white),
          ),
          const SizedBox(height: 4),
          Text(
            title.toUpperCase(),
            style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold, letterSpacing: 1, color: AppColors.textMuted),
          ),
        ],
      ),
    );
  }
}

class _HistoryItem extends StatelessWidget {
  final String date;
  final String score;
  final String status;

  const _HistoryItem({required this.date, required this.score, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border.withOpacity(0.5)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(LucideIcons.barChart3, size: 20, color: AppColors.accent),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(date, style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.textMain)),
                Text(status, style: const TextStyle(fontSize: 12, color: AppColors.textMuted)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(score, style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textMain)),
              const Text('SCORE', style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: AppColors.textMuted)),
            ],
          ),
        ],
      ),
    );
  }
}
