class Education {
  String school;
  String degree;
  String fieldOfStudy;
  String description;
  String location;
  DateTime entry_date;
  DateTime grad_date;

  Education(
      {this.school,
      this.degree,
      this.fieldOfStudy,
      this.description,
      this.entry_date,
      this.grad_date,
      this.location});

  Education.fromJson(Map<String, Object> json) {
    school = json['school'];
    degree = json['degree'];
    fieldOfStudy = json['fieldOfStudy'];
    description = json['description'];
    location = json['location'];
    entry_date = json['entry_date'];
    grad_date = json['grad_date'];
  }
}
