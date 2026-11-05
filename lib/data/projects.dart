import 'package:birendra_portfolio/models/project_model.dart';

const List<ProjectModel> allProjects = [
  ProjectModel(
    slug: 'ride-together',
    title: 'rideTogether',
    tagline: 'Group Ride Coordination App',
    summary:
        "A Flutter application for coordinating group rides and "
        "monitoring members' real time locations.",
    overview:
        'rideTogether helps riders organize and follow group rides. '
        'Riders create and join a ride with a ride code, gather in a waiting '
        'room, and track each other on a live map while the ride leader '
        'manages the ride from start to finish.',
    features: [
      'User authentication and profile management',
      'Create and join group rides',
      'Ride codes and waiting rooms',
      'Live group ride map and rider location tracking',
      'Rider status and participant management',
      'Ride leader controls and ride lifecycle management',
    ],
    technologies: ['Flutter', 'Firebase', 'GetX', 'GoRouter', 'OpenStreetMap'],
    status: ProjectStatus.ongoing,
    imageAsset: '',
    githubUrl: 'https://github.com/birendrakalauni/ride-together',
  ),
  ProjectModel(
    slug: 'hamaro-gunaso',
    title: 'Hamaro Gunaso',
    tagline: 'Public Issue Reporting System',
    summary:
        'A Flutter and Firebase based public issue reporting system '
        'with separate dashboards for users and admins.',
    overview:
        'Hamaro Gunaso is a public issue reporting system built with '
        'Flutter and Firebase. It provides separate dashboards for users and '
        'administrators.',
    features: [
      'Separate user and admin dashboards',
      'Firebase Authentication',
      'Cloud Firestore for data storage',
      'State management with Provider',
      'Image upload functionality',
    ],
    technologies: ['Flutter', 'Firebase', 'Cloud Firestore', 'Provider'],
    imageAsset: '',
    githubUrl: 'https://github.com/birendrakalauni/hamaro_gunaso',
  ),
  ProjectModel(
    slug: 'flashcard-quiz',
    title: 'Flashcard Quiz App',
    tagline: 'Offline Flashcard App',
    summary:
        'An offline flashcard application built with Flutter, using '
        'SQLite and Provider for local data and state.',
    overview:
        'Flashcard Quiz App is an offline flashcard application built '
        'with Flutter. Flashcards are stored locally with SQLite, so the app '
        'works without an internet connection.',
    features: [
      'Create, manage, and study flashcards offline',
      'CRUD operations for flashcards',
      'Local storage with SQLite',
      'State management with Provider'
          'Responsive Material Design UI',
    ],
    technologies: ['Flutter', 'SQLite', 'Provider'],
    imageAsset: '',
    githubUrl: 'https://github.com/birendrakalauni/flashcard_quiz_app',
  ),
];

ProjectModel? projectBySlug(String slug) {
  for (final project in allProjects) {
    if (project.slug == slug) return project;
  }
  return null;
}
