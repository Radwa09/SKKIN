import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/glass_card.dart';

class RecommendationsPage extends StatefulWidget {
  const RecommendationsPage({super.key});

  @override
  State<RecommendationsPage> createState() => _RecommendationsPageState();
}

class _RecommendationsPageState extends State<RecommendationsPage> {
  String activeTab = 'morning';

  final Map<String, List<Map<String, String>>> routines = {
    'morning': [
      {'name': 'Hydrating Cleanser', 'step': 'STEP 01', 'category': 'CLEANSE', 'desc': 'Gentle ph-balanced formula.', 'why': 'Maintains moisture barrier.'},
      {'name': 'Vitamin C Serum', 'step': 'STEP 02', 'category': 'TREAT', 'desc': '15% L-Ascorbic Acid.', 'why': 'Brightens and protects.'},
      {'name': 'SPF 50+ Sunscreen', 'step': 'STEP 03', 'category': 'PROTECT', 'desc': 'Clinical UV protection.', 'why': 'Prevents photo-aging.'},
    ],
    'night': [
      {'name': 'Double Cleanse Oil', 'step': 'STEP 01', 'category': 'CLEANSE', 'desc': 'Dissolves impurities.', 'why': 'Deep pore purification.'},
      {'name': 'Retinol 0.5%', 'step': 'STEP 02', 'category': 'TREAT', 'desc': 'Clinical grade retinoid.', 'why': 'Accelerates cell turnover.'},
      {'name': 'Ceramide Repair', 'step': 'STEP 03', 'category': 'HYDRATE', 'desc': 'Barrier recovery cream.', 'why': 'Intensive nightly repair.'},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(LucideIcons.arrowLeft, color: AppColors.textMain),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 32),
            _buildSummaryCard(),
            const SizedBox(height: 48),
            _buildTabSwitcher(),
            const SizedBox(height: 32),
            _buildProductList(),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: GoogleFonts.playfairDisplay(fontSize: 40, height: 1.1, color: AppColors.textMain),
            children: const [
              TextSpan(text: 'Your Personalized\n'),
              TextSpan(text: 'Routine', style: TextStyle(fontStyle: FontStyle.italic, color: AppColors.accent)),
            ],
          ),
        ).animate().fadeIn().slideX(),
        const SizedBox(height: 8),
        const Text(
          'Customized skincare recommendations based on your analysis',
          style: TextStyle(color: AppColors.textDim, fontWeight: FontWeight.w300),
        ).animate().fadeIn(delay: 200.ms),
      ],
    );
  }

  Widget _buildSummaryCard() {
    return GlassCard(
      color: AppColors.surface.withOpacity(0.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Routine for Combination Skin',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: ['Dryness Treatment', 'Dark Spot Reduction', 'Texture Improvement']
                .map((tag) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.border,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Text(tag, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.textMain)),
                    ))
                .toList(),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.1);
  }

  Widget _buildTabSwitcher() {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _TabButton(
              label: 'Morning',
              icon: LucideIcons.sun,
              isActive: activeTab == 'morning',
              onTap: () => setState(() => activeTab = 'morning'),
            ),
            _TabButton(
              label: 'Night',
              icon: LucideIcons.moon,
              isActive: activeTab == 'night',
              onTap: () => setState(() => activeTab = 'night'),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(delay: 600.ms);
  }

  Widget _buildProductList() {
    final products = routines[activeTab]!;
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return _ProductCard(
          name: product['name']!,
          step: product['step']!,
          category: product['category']!,
          desc: product['desc']!,
          why: product['why']!,
        ).animate(key: ValueKey('${activeTab}_$index')).fadeIn(delay: (index * 100).ms).slideX(begin: 0.05);
      },
    );
  }
}

class _TabButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;

  const _TabButton({required this.label, required this.icon, required this.isActive, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(26),
        ),
        child: Row(
          children: [
            Icon(icon, size: 16, color: isActive ? Colors.white : AppColors.textDim),
            const SizedBox(width: 8),
            Text(
              label.toUpperCase(),
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: isActive ? Colors.white : AppColors.textDim,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final String name;
  final String step;
  final String category;
  final String desc;
  final String why;

  const _ProductCard({required this.name, required this.step, required this.category, required this.desc, required this.why});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: GlassCard(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(step, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.emerald, letterSpacing: 1.5)),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.amber.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.amber.withOpacity(0.1)),
                  ),
                  child: Text(category, style: const TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Colors.amber)),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(name, style: GoogleFonts.playfairDisplay(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.textMain)),
            const SizedBox(height: 8),
            Text(desc, style: const TextStyle(fontSize: 14, color: AppColors.textDim, fontWeight: FontWeight.w300)),
            const SizedBox(height: 16),
            RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 12, color: AppColors.textMuted),
                children: [
                  const TextSpan(text: 'WHY: ', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: why, style: const TextStyle(color: AppColors.accentLight)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
