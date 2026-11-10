import 'package:birendra_portfolio/core/constants/portfolio_section.dart';
import 'package:birendra_portfolio/sections/about_section.dart';
import 'package:birendra_portfolio/sections/contact_section.dart';
import 'package:birendra_portfolio/sections/experience_section.dart';
import 'package:birendra_portfolio/sections/hero_section.dart';
import 'package:birendra_portfolio/sections/projects_section.dart';
import 'package:birendra_portfolio/sections/skills_section.dart';
import 'package:birendra_portfolio/widgets/mobile_menu.dart';
import 'package:birendra_portfolio/widgets/navbar.dart';
import 'package:birendra_portfolio/widgets/reveal.dart';
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
    switch (section) {
      case PortfolioSection.home:
        return HeroSection(
          onViewProjects: () => _scrollToSection(PortfolioSection.projects),
          onContactMe: () => _scrollToSection(PortfolioSection.contact),
        );

      case PortfolioSection.about:
        return const AboutSection();

      case PortfolioSection.skills:
        return const SkillsSection();

      case PortfolioSection.projects:
        return const ProjectsSection();

      case PortfolioSection.experience:
        return const ExperienceSection();

      case PortfolioSection.contact:
        return const ContactSection();
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
              Reveal(key: _sectionKeys[section], child: _buildSection(section)),

            SiteFooter(
              onBackToTop: () => _scrollToSection(PortfolioSection.home),
            ),
          ],
        ),
      ),
    );
  }
}
