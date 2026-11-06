import 'package:flutter_test/flutter_test.dart';

import 'package:birendra_portfolio/data/projects.dart';
import 'package:birendra_portfolio/providers/project_provider.dart';

void main() {
  group('ProjectProvider', () {
    test('starts with all projects and no filter', () {
      final provider = ProjectProvider();

      expect(provider.selectedFilter, isNull);
      expect(provider.filteredProjects.length, allProjects.length);
    });

    test('filters by technology and notifies once per change', () {
      final provider = ProjectProvider();
      var notifications = 0;
      provider.addListener(() => notifications++);

      provider.selectFilter('SQLite');
      expect(
        provider.filteredProjects.map((p) => p.slug).toList(),
        ['flashcard-quiz'],
      );
      expect(notifications, 1);

      provider.selectFilter('SQLite'); // unchanged: no notification
      expect(notifications, 1);

      provider.selectFilter(null);
      expect(provider.filteredProjects.length, allProjects.length);
      expect(notifications, 2);
    });

    test('every filter chip matches at least one project', () {
      for (final filter in ProjectProvider.filters) {
        final provider = ProjectProvider()..selectFilter(filter);
        expect(provider.filteredProjects, isNotEmpty, reason: filter);
      }
    });
  });

  group('project data', () {
    test('slugs are unique and can be looked up', () {
      final slugs = allProjects.map((p) => p.slug).toList();

      expect(slugs.toSet().length, slugs.length);
      expect(projectBySlug('ride-together')?.title, 'rideTogether');
      expect(projectBySlug('does-not-exist'), isNull);
    });
  });
}