import 'package:birendra_portfolio/data/projects.dart';
import 'package:birendra_portfolio/models/project_model.dart';
import 'package:flutter/foundation.dart';

class ProjectProvider extends ChangeNotifier {
  ProjectProvider({this._projects = allProjects});

  final List<ProjectModel> _projects;

  static const List<String> filters = [
    'Firebase',
    'Provider',
    'GetX',
    'SQLite',
  ];

  String? _selectedFilter;

  String? get selectedFilter => _selectedFilter;

  List<ProjectModel> get filteredProjects {
    final filter = _selectedFilter;
    if (filter == null) return _projects;
    return _projects
        .where((project) => project.technologies.contains(filter))
        .toList();
  }

  void selectFilter(String? filter) {
    if (filter == _selectedFilter) return;
    _selectedFilter = filter;
    notifyListeners();
  }
}
