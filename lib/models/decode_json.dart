abstract class DecodeJson {
  DecodeJson();

  DecodeJson.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson();
}