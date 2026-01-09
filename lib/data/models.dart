// lib/data/models.dart
import 'package:flutter/material.dart';

class PortfolioData {
  // General Info
  final String name;
  final String title;
  final String about;
  final String email;
  final String resumeLink;

  // Section Visibility (e.g., {'skills': true, 'projects': false})
  final Map<String, bool> sectionVisibility;

  // Design Config (Theme)
  final ThemeConfig themeConfig;

  // Data Lists
  final List<Skill> skills;
  final List<Project> projects;
  final List<Experience> experience;
  final List<Education> education;

  PortfolioData({
    required this.name,
    required this.title,
    required this.about,
    required this.email,
    required this.resumeLink,
    required this.sectionVisibility,
    required this.themeConfig,
    required this.skills,
    required this.projects,
    required this.experience,
    required this.education,
  });

  PortfolioData copyWith({
    String? name,
    String? title,
    String? about,
    String? email,
    String? resumeLink,
    Map<String, bool>? sectionVisibility,
    ThemeConfig? themeConfig,
    List<Skill>? skills,
    List<Project>? projects,
    List<Experience>? experience,
    List<Education>? education,
  }) {
    return PortfolioData(
      name: name ?? this.name,
      title: title ?? this.title,
      about: about ?? this.about,
      email: email ?? this.email,
      resumeLink: resumeLink ?? this.resumeLink,
      sectionVisibility: sectionVisibility ?? this.sectionVisibility,
      themeConfig: themeConfig ?? this.themeConfig,
      skills: skills ?? this.skills,
      projects: projects ?? this.projects,
      experience: experience ?? this.experience,
      education: education ?? this.education,
    );
  }
}

class ThemeConfig {
  final int primaryColorValue; // Store as int for easy JSON serialization
  final bool useMaterial3;

  ThemeConfig({this.primaryColorValue = 0xFF2563EB, this.useMaterial3 = true});

  Color get primaryColor => Color(primaryColorValue);

  ThemeConfig copyWith({int? primaryColorValue, bool? useMaterial3}) {
    return ThemeConfig(
      primaryColorValue: primaryColorValue ?? this.primaryColorValue,
      useMaterial3: useMaterial3 ?? this.useMaterial3,
    );
  }
}

class Skill {
  final String name;
  final String category;

  Skill(this.name, this.category);
}

class Project {
  final String title;
  final String desc;
  final List<String> tags;
  final String? link;

  Project(this.title, this.desc, this.tags, {this.link});
}

class Experience {
  final String role;
  final String company;
  final String period;
  final String desc;

  Experience(this.role, this.company, this.period, this.desc);
}

class Education {
  final String degree;
  final String school;
  final String period;
  final String desc;

  Education(this.degree, this.school, this.period, this.desc);
}
