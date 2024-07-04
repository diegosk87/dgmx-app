import 'dart:convert';

import 'package:dgmx_app/data/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final String _taskStorageKey = 'tasks_storage';
  final GetStorage _storage = Get.find<GetStorage>();

  RxList<TaskModel> tasks = <TaskModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    restoreStorageTasks();
  }

  Future<void> restoreStorageTasks() async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    String? jsonTasks = _storage.read<String?>(_taskStorageKey);
    
    if(jsonTasks != null) {
      tasks.addAll(List<TaskModel>.from(
        (jsonDecode(jsonTasks) as List<dynamic>).map(
          (dynamic e) => TaskModel.fromJson(e as Map<String, dynamic>))));
    }
  }

  void changeTaskStatus(String id) {
    tasks.firstWhere((TaskModel task) => task.id == id).status = true;
    tasks.refresh();

    _refreshStorage();
  }

  List<TaskModel> getTasks(bool status) {
    return tasks.where((TaskModel task) => task.status == status).toList();
  }

  void removeTask(String id) {
    tasks.removeWhere((TaskModel task) => task.id == id);

    _refreshStorage();
  }

  void addNewTaskForm() {
    String? title;
    String? description;

    Get.bottomSheet<dynamic>(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text('Agregar tarea',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
              TextField(
                decoration: const InputDecoration(
                  label: Text('Titulo')
                ),
                keyboardType: TextInputType.text,
                onChanged: (String text) {
                  title = text;
                },
              ),
              const SizedBox(height: 15),
              TextField(
                decoration: const InputDecoration(
                  label: Text('Descripción')
                ),
                keyboardType: TextInputType.text,
                onChanged: (String text) {
                  description = text;
                },
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  
                ),
                onPressed: () {
                  addNewTask(
                    title: title,
                    description: description);

                  Get.back();
                },
                child: const Text('Agregar')),
              const SizedBox(height: 20),
            ],
          )
        ),
      ),
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      elevation: 0,
      enableDrag: true,
    );
  }

  void addNewTask({String? title, String? description}) {
    tasks.add(TaskModel(
      id: '${tasks.length + 1}',
      title: title ?? 'Sin titulo',
      description: description ?? 'Sin descripción',
      status: false));

    _refreshStorage();
  }

  void _refreshStorage() {
    String jsonTasks = json.encode(
      tasks.map((TaskModel task) =>
        task.toJson()).toList());

    _storage.write(_taskStorageKey, jsonTasks);
  }
}