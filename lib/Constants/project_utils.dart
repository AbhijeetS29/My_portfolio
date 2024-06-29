class ProjectUtils {
  final String image;
  final String title;
  final String subtitle;
  final String? webLink;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    this.webLink,
  });
}

List<ProjectUtils> workProjectUtils = [
  ProjectUtils(
    image: 'assets/images/ninja.png',
    title: 'Task Ninja',
    subtitle:
        'A synchronized Mobile application as well as Computer Software, based on Task Management System, built in order to bring time management in ordinary life of people',
    webLink: 'https://www.externally.unavailable.project',
  ),
];

