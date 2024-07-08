import 'package:flutter/material.dart';

class AboutUtils {
  final IconData image;
  final String title;
  final String subtitle;

  AboutUtils({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}

List<AboutUtils> aboutProjectUtils = [
  AboutUtils(
    image: Icons.developer_mode,
    title: 'Application Developer',
    subtitle:
    'Transforming ideas into reality with cutting-edge \nmobile solutions and seamless user experiences.',
  ),
  AboutUtils(
    image: Icons.design_services,
    title: 'UI/UX Designer',
    subtitle:
    'Crafting intuitive and aesthetically pleasing\ndesigns to enhance user engagement and satisfaction.',
  ),
  AboutUtils(
    image: Icons.volunteer_activism,
    title: 'Volunteer Worker',
    subtitle:
    'Dedicated to community service, leveraging technology\nto streamline processes and improve outcomes.',
  ),
  AboutUtils(
    image: Icons.edit,
    title: 'Content Writer',
    subtitle:
    'Creating compelling and persuasive content that\nresonates with audiences and drives engagement.',
  ),
];
