// lib/providers/portfolio_state.dart
import 'package:flutter_riverpod/legacy.dart';

import '../data/models.dart';

final _initialData = PortfolioData(
  name: "Arya Ashish Mehta",
  title: "Software Engineer · Flutter · PHP · Python",
  about:
      "I am a Computer Engineering student and Software Engineer focused on building scalable systems. "
      "I have professional experience developing mobile apps with Flutter and backend systems using PHP. "
      "My work includes creating dynamic document generation tools, management information apps, and efficient REST APIs.",
  email: "mehtaarya18@gmail.com",
  // You can replace this with your actual resume URL if hosted online,
  // or keep it as is if you are using the local asset download logic.
  resumeLink: "https://www.linkedin.com/in/arya-mehta-01b3702a7/",
  sectionVisibility: {
    'hero': true,
    'about': true,
    'skills': true,
    'projects': true,
    'experience': true,
    'education': true,
    'contact': true,
  },
  themeConfig: ThemeConfig(),
  // Default Blue Theme

  // Mapped from your Resume's "Technical Skills"
  skills: [
    Skill("Flutter", "Mobile"),
    Skill("Dart", "Language"),
    Skill("PHP", "Backend"),
    Skill("MySQL", "Database"),
    Skill("Python", "Language"),
    Skill("Java", "Language"),
    Skill("C/C++", "Language"),
    Skill("HTML/CSS", "Frontend"),
    Skill("JavaScript", "Frontend"),
  ],

  // Mapped from your "Personal Projects"
  projects: [
    Project(
      "GSTMate App",
      "A Flutter mobile app for generating and resolving GST-related queries with tracking functionalities.",
      ["Flutter", "Dart", "Mobile"],
    ),
    Project(
      "Doctor File Management",
      "Web-based system for managing doctor files with secure login and role-based access control.",
      ["PHP", "MySQL", "JavaScript", "HTML/CSS"],
    ),
    Project(
      "Appointment Management",
      "System for booking and rescheduling appointments with a dedicated admin panel for doctor schedules.",
      ["PHP", "MySQL", "jQuery"],
    ),
  ],

  // Mapped from "Internship Experience"
  experience: [
    Experience(
      "Software Development Intern",
      "Pragma Infotech",
      "Feb 2025 - Aug 2025",
      "Created dynamic document generation systems using PHP and developed a mobile app with Flutter for user notice management. "
          "Built REST APIs and tested various web/mobile projects including Orpel and OneCare apps.",
    ),
  ],

  // Mapped from "Education"
  education: [
    Education(
      "B.Tech in Computer Engineering",
      "Bhagwan Mahavir University",
      "Pursuing",
      "CGPA: 7.04/10",
    ),
    Education(
      "Higher Secondary (12th)",
      "Radiant English Academy",
      "Completed",
      "Score: 80.4%",
    ),
    Education(
      "Secondary (10th)",
      "Radiant English Academy",
      "Completed",
      "Score: 84.6%",
    ),
  ],
);

final portfolioProvider =
    StateNotifierProvider<PortfolioNotifier, PortfolioData>((ref) {
      return PortfolioNotifier();
    });

class PortfolioNotifier extends StateNotifier<PortfolioData> {
  PortfolioNotifier() : super(_initialData);

  // --- GENERAL UPDATES ---
  void updateProfile({
    String? name,
    String? title,
    String? about,
    String? email,
    String? resume,
  }) {
    state = state.copyWith(
      name: name,
      title: title,
      about: about,
      email: email,
      resumeLink: resume,
    );
  }

  // --- THEME UPDATES ---
  void updateThemeColor(int colorValue) {
    state = state.copyWith(
      themeConfig: state.themeConfig.copyWith(primaryColorValue: colorValue),
    );
  }

  // --- VISIBILITY TOGGLE ---
  void toggleSection(String sectionKey) {
    final newVisibility = Map<String, bool>.from(state.sectionVisibility);
    newVisibility[sectionKey] = !(newVisibility[sectionKey] ?? false);
    state = state.copyWith(sectionVisibility: newVisibility);
  }

  // --- PROJECT CRUD ---
  void addProject(Project project) {
    state = state.copyWith(projects: [...state.projects, project]);
  }

  void removeProject(int index) {
    final newList = List<Project>.from(state.projects)..removeAt(index);
    state = state.copyWith(projects: newList);
  }

  // --- EXPERIENCE CRUD ---
  void addExperience(Experience exp) {
    state = state.copyWith(experience: [...state.experience, exp]);
  }

  void removeExperience(int index) {
    final newList = List<Experience>.from(state.experience)..removeAt(index);
    state = state.copyWith(experience: newList);
  }

  // --- EDUCATION CRUD ---
  void addEducation(Education edu) {
    state = state.copyWith(education: [...state.education, edu]);
  }

  void removeEducation(int index) {
    final newList = List<Education>.from(state.education)..removeAt(index);
    state = state.copyWith(education: newList);
  }

  // --- SKILLS CRUD ---
  void addSkill(Skill skill) {
    state = state.copyWith(skills: [...state.skills, skill]);
  }

  void removeSkill(int index) {
    final newList = List<Skill>.from(state.skills)..removeAt(index);
    state = state.copyWith(skills: newList);
  }
}
