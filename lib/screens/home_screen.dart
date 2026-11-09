import 'package:birendra_portfolio/core/constants/portfolio_section.dart';
import 'package:birendra_portfolio/sections/about_section.dart';
import 'package:birendra_portfolio/sections/contact_section.dart';
import 'package:birendra_portfolio/sections/experience_section.dart';
import 'package:birendra_portfolio/sections/hero_section.dart';
import 'package:birendra_portfolio/sections/projects_section.dart';
import 'package:birendra_portfolio/sections/skills_section.dart';
import 'package:birendra_portfolio/widgets/mobile_menu.dart';
import 'package:birendra_portfolio/widgets/navbar.dart';
import 'package:birendra_portfolio/widgets/site_footer.dart';
import 'package:flutter/material.dart';

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

  Widget _buildSection(PortfolioSection section) {
    final key = _sectionKeys[section];
    switch (section) {
      case PortfolioSection.home:
        return HeroSection(
          key: key,
          onViewProjects: () => _scrollToSection(PortfolioSection.projects),
          onContactMe: () => _scrollToSection(PortfolioSection.contact),
        );

      case PortfolioSection.about:
        return AboutSection(key: key);

      case PortfolioSection.skills:
        return SkillsSection(key: key);

      case PortfolioSection.projects:
        return ProjectsSection(key: key);

      case PortfolioSection.experience:
        return ExperienceSection(key: key);

      case PortfolioSection.contact:
        return ContactSection(key: key);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(onItemSelected: _scrollToSection),
      endDrawer: MobileMenu(onItemSelected: _scrollToSection),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (final section in PortfolioSection.values)
              _buildSection(section),

              SiteFooter(onBackToTop: () => _scrollToSection(PortfolioSection.home))
          ],
        ),
      ),
    );
  }
}

