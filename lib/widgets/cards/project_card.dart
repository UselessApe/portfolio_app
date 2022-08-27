import 'package:flutter/material.dart';
import 'package:portfolioapp/models/project.dart';
import 'package:portfolioapp/pages/project/project_detail.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  const ProjectCard({required this.project, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProjectDetail(
            project: project,
          ),
        ),
      ),
      child: Container(
        width: 300,
        height: 350,
        margin: const EdgeInsets.only(right: 15, bottom: 20, left: 10),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              offset: const Offset(5, 15),
              color: Colors.black.withOpacity(.5),
              blurRadius: 15,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  project.name,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black,
                  ),
                  child: Text(
                    project.year.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: Hero(
                tag: project.name,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(project.imageUrl, fit: BoxFit.cover),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              project.description,
              maxLines: 3,
              style: const TextStyle(
                  fontSize: 14, overflow: TextOverflow.ellipsis),
            ),
          ],
        ),
      ),
    );
  }
}
