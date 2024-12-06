class ProjectUtils {
  final String image;
  final String title;
  final String subtitle;
  final String? webLink;
  final String language;
  final String view;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    this.webLink,
    required this.language,
    required this.view,
  });
}

List<ProjectUtils> workProjectUtils = [
  ProjectUtils(
    image: 'assets/images/ninja.png',
    title: 'Task Ninja',
    language: "assets/images/android.png",
    subtitle:
    'A synchronized mobile application and computer software based on a task management system, built to improve time management in people\'s daily lives.',
    webLink: 'https://github.com/AbhijeetS29/Task_Ninja_/tree/main',
    view: 'View on Github',
  ),
  ProjectUtils(
    image: 'assets/images/reading-book.png',
    title: 'Srishti Sanwaad',
    language: "assets/images/flutter.png",
    subtitle:
    'Digital book app that allows offline access to books authored by Mr. Vivek Joshi, President of Madhav Sewa Society, by downloading and saving them locally.',
    webLink: 'https://github.com/AbhijeetS29/Sarishti_Sanwaad_ReadMe',
    view: 'View on Github',
  ),
  ProjectUtils(
    image: 'assets/images/presentation.png',
    title: 'MSS Student Wing',
    language: "assets/images/flutter.png",
    subtitle:
    'Attendance and student management app that tracks entry/exit times, documents, daily tests, and announcements. Includes sections for volunteer details, tasks, and completion status.',
    webLink: 'https://github.com/AbhijeetS29/MSS_StudentWing_Readme',
    view: 'View on Github',
  ),
  ProjectUtils(
    image: 'assets/images/mudra.png',
    title: 'Soul Serenity',
    language: "assets/images/android.png",
    subtitle:
    'Application that holds Mudras, daily motivational videos prepared by Vivek Joshi.Each Mudra is explained in English, Hindi, Punjabi',
    webLink: 'https://github.com/AbhijeetS29/soul_serenity_readme',
    view: 'View on Github',
  ),
  ProjectUtils(
    image: 'assets/images/scrap.png',
    title: 'Scrap Calculator',
    language: "assets/images/flutter.png",
    subtitle:
    'A random project where scrap collectors can calculate the price of waste collected by entering its weight and rate per weight of various objects.',
    webLink: 'https://github.com/AbhijeetS29/scrap_calculator_readme',
    view: 'View on Github',
  ),
];




