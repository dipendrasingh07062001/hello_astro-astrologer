class ExpertiseModel {
  int? id;
  String? name;
  String? image;
  String? status;

  ExpertiseModel({
    this.id,
    this.name,
    this.image,
    this.status,
  });

  factory ExpertiseModel.fromJson(Map<String, dynamic> json) => ExpertiseModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "status": status,
      };
}
