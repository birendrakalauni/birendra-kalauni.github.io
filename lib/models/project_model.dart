// ignore_for_file: public_member_api_docs, sort_constructors_first
enum ProjectStatus {
  ongoing("Ongoing"),
  completed('Completed');

  const ProjectStatus(this.label);
  final String label;
}

class ProjectModel {
  final String slug;
  final String title;
  final String tagline;

  final String summary;

  final String overview;
  final List<String> features;
  final List<String> technologies;
  final ProjectStatus? status;

  final String? imageAsset;

  final String? githubUrl;

  final String? liveUrl;

  const ProjectModel({
    required this.slug,
    required this.title,
    required this.tagline,
    required this.summary,
    required this.overview,
    required this.features,
    required this.technologies,
    this.status,
    this.imageAsset,
    this.githubUrl,
    this.liveUrl,
  });
}
