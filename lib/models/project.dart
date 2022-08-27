class Project {
  String name;
  int year;
  String description;
  String imageUrl;
  List<String>? technologies;
  Project(
      {required this.name,
      required this.year,
      required this.description,
      required this.imageUrl,
      this.technologies});
}
