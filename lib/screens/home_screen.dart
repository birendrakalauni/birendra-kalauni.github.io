import 'package:birendra_portfolio/core/constants/app_colors.dart';
import 'package:birendra_portfolio/core/constants/portfolio_section.dart';
import 'package:birendra_portfolio/widgets/mobile_menu.dart';
import 'package:birendra_portfolio/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Map<PortfolioSection, GlobalKey> _sectionKeys = {
    for (final section in PortfolioSection.values) section: GlobalKey(),
  };

  void _scrollToSection(PortfolioSection section) {
    final sectionContext = _sectionKeys[section]?.currentContext;
    if (sectionContext == null) return;

    Scrollable.ensureVisible(
      sectionContext,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: Navbar(onItemSelected: _scrollToSection),
      endDrawer: MobileMenu(onItemSelected: _scrollToSection),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (final section in PortfolioSection.values)
              _PlaceholderSection(key: _sectionKeys[section], section: section),
          ],
        ),
      ),
    );
  }
}

class _PlaceholderSection extends StatelessWidget {
  const _PlaceholderSection({super.key, required this.section});

  final PortfolioSection section;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 600),
      color: section.index.isEven ? AppColors.background : AppColors.surface,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${section.label} section',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          if (section == PortfolioSection.projects) ...[
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => context.go('/projects/ride-together'),
              child: const Text('Open sample project page'),
            ),
          ],
        ],
      ),
    );
  }
}
