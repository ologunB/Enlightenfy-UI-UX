class Experience {
  String title;
  String summary;
  String achievements;
  String projects;
  String resume;
  String portfolio;

  Experience(
      {this.title,this.resume, this.portfolio, this.achievements, this.projects, this.summary});

  Experience.fromJson(Map<String, Object> json) {
    title = json['title'];
    summary = json['summary'];
    achievements = json['achievements'];
    projects = json['projects'];
    resume = json['resume'];
    portfolio = json['portfolio'];
  }
}
