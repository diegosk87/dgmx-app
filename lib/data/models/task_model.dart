import 'dart:convert';

class TaskModel {
  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.status
  });

  final String id;
  final String title;
  final String description;
  bool status;

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
    id: json['id'].toString(),
    title: json['title'].toString(),
    description: json['description'].toString(),
    status: json['status']);

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'title': title,
    'description': description,
    'status': status
  };

  @override
  String toString() => json.encode(toJson());
}