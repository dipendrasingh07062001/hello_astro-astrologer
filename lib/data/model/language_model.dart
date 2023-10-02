class LanguageModel {
  String? id = '';
  String? language = '';
  bool isSelected = false;
  LanguageModel({
    this.id,
    this.language,
    this.isSelected = false,
  });
  LanguageModel.fromjson(Map<String, dynamic> json) {
    id = json["id"].toString();
    language = json["language"];
  }
}
