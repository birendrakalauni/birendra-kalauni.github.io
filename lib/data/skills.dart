import 'package:birendra_portfolio/models/skill_category.dart';
import 'package:flutter/material.dart';

List<SkillCategory> skillCategories = [
  SkillCategory(
    title: 'Programming',
    icon: Icons.code,
    skills: ['Dart', 'Java', 'SQL'],
  ),
  SkillCategory(
    title: 'Mobile Development',
    icon: Icons.phone_android,
    skills: ['Flutter', 'Android Studio'],
  ),
  SkillCategory(
    title: 'State Management',
    icon: Icons.hub_outlined,
    skills: ['GetX', 'Provider', 'BLoC'],
  ),
  SkillCategory(
    title: 'Backend & APIs',
    icon: Icons.cloud_outlined,
    skills: ['Firebase', 'Cloud Firestore', 'REST APIs'],
  ),
  SkillCategory(
    title: 'Databases',
    icon: Icons.storage_outlined,
    skills: ['SQLite'],
  ),
  SkillCategory(
    title: 'Tools & Design',
    icon: Icons.design_services_outlined,
    skills: ['Git', 'GitHub', 'VS Code', 'Figma'],
  ),
];
