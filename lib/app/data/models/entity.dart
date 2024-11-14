// To parse this JSON data, do
//
//     final entity = entityFromJson(jsonString);

import 'dart:convert';

Entity entityFromJson(String str) => Entity.fromJson(json.decode(str));

String entityToJson(Entity data) => json.encode(data.toJson());

class Entity {
  final String? message;
  final String? assignmentInstructionUrl;
  final String? information;
  final JsonResponse? jsonResponse;

  Entity({
    this.message,
    this.assignmentInstructionUrl,
    this.information,
    this.jsonResponse,
  });

  factory Entity.fromJson(Map<String, dynamic> json) => Entity(
    message: json["message"],
    assignmentInstructionUrl: json["assignmentInstructionUrl"],
    information: json["information"],
    jsonResponse: json["json_response"] == null ? null : JsonResponse.fromJson(json["json_response"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "assignmentInstructionUrl": assignmentInstructionUrl,
    "information": information,
    "json_response": jsonResponse?.toJson(),
  };
}

class JsonResponse {
  final List<Attribute>? attributes;

  JsonResponse({
    this.attributes,
  });

  factory JsonResponse.fromJson(Map<String, dynamic> json) => JsonResponse(
    attributes: json["attributes"] == null ? [] : List<Attribute>.from(json["attributes"]!.map((x) => Attribute.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "attributes": attributes == null ? [] : List<dynamic>.from(attributes!.map((x) => x.toJson())),
  };
}

class Attribute {
  final String? id;
  final String? title;
  final String? type;
  final List<String>? options;
  final bool required;  // Add this property

  Attribute({
    this.id,
    this.title,
    this.type,
    this.options,
    this.required = false,  // Default to false, meaning not required
  });

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
    id: json["id"],
    title: json["title"],
    type: json["type"],
    options: json["options"] == null ? [] : List<String>.from(json["options"]!.map((x) => x)),
    required: json["required"] ?? false,  // If available in JSON, otherwise default to false
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "type": type,
    "options": options == null ? [] : List<dynamic>.from(options!.map((x) => x)),
    "required": required,  // Include required in the JSON
  };
}
