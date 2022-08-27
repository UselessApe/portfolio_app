import 'package:flutter/material.dart';
import 'package:portfolioapp/models/project.dart';

import '../../responsive.dart';
import '../../widgets/horizontalTechView/horizontal_tech_view.dart';

class ProjectDetail extends StatelessWidget {
  final Project project;
  const ProjectDetail({required this.project, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    BackButton(
                      onPressed: () => Navigator.pop(context),
                    ),
                    Text(
                      project.name,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black,
                      ),
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        project.year.toString(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Hero(
                  tag: project.name,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Responsive(
                      mobile: Image.network(
                        project.imageUrl,
                        fit: BoxFit.cover,
                      ),
                      tablet: Image.network(
                        project.imageUrl,
                        fit: BoxFit.cover,
                      ),
                      desktop: SizedBox(
                        height: 350,
                        child: Image.network(
                          project.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Technlogies",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                HorizontalTechView(techList: project.technologies ?? []),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Description",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(project.description),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
