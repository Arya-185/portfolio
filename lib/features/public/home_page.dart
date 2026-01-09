// lib/features/public/home_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/features/public/sections/project_section.dart'; // Ensure this import is correct based on your file structure
import 'package:url_launcher/url_launcher.dart';

import '../../providers/portfolio_state.dart';
import 'components/footer.dart';
import 'components/nav_bar.dart';
import 'components/section_wrapper.dart';
import 'sections/about_section.dart';
import 'sections/contact_section.dart';
import 'sections/education_section.dart';
import 'sections/experience_section.dart';
import 'sections/hero_section.dart';
import 'sections/skills_section.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(portfolioProvider);
    final visible = data.sectionVisibility; // Get the map
    return Scaffold(
      // backgroundColor: Colors.white, // <--- REMOVE THIS LINE
      // The background will now come from Theme.of(context).scaffoldBackgroundColor
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => launchUrl(Uri.parse(data.resumeLink)),
        // Use theme colors for FAB to match the rest of the app
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        icon: const Icon(Icons.download),
        label: const Text("Resume"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavBar(name: data.name),

            // Check visibility for every section
            if (visible['hero'] == true)
              SectionWrapper(child: HeroSection(data: data)),

            if (visible['about'] == true)
              SectionWrapper(child: AboutSection(about: data.about)),

            if (visible['education'] == true)
              SectionWrapper(
                child: EducationSection(education: data.education),
              ),

            if (visible['skills'] == true)
              SectionWrapper(child: SkillsSection(skills: data.skills)),

            if (visible['projects'] == true)
              SectionWrapper(child: ProjectsSection(projects: data.projects)),

            if (visible['experience'] == true)
              SectionWrapper(
                child: ExperienceSection(experience: data.experience),
              ),

            if (visible['contact'] == true)
              SectionWrapper(child: ContactSection(email: data.email)),

            const Footer(),
          ],
        ),
      ),
    );
  }
}
