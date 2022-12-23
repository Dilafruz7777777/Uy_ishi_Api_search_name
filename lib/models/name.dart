class NameM {
  final int? count;
  final String? gender;
  final String? name;

  NameM({this.count, this.gender, this.name});

  factory NameM.fromJson(Map data) {
    return NameM(
      count: data['count'],
      gender: data["gender"],
      name: data["name"],
    );
  }
}
