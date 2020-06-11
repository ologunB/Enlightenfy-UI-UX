class Experience {
  String title;
  String company_name;
  String description;
  String from;
  String to;

  Experience(
      {this.title, this.company_name, this.description, this.from, this.to});

  Experience.fromJson(Map<String, Object> json) {
    title = json['title'];
    company_name = json['company_name'];
    description = json['description'];
    from = json['from'];
    to = json['to'];
  }
}
