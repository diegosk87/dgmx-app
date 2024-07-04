import 'package:dgmx_app/app/home/home_controller.dart';
import 'package:dgmx_app/core/configs/global_vars.dart';
import 'package:dgmx_app/core/widgets/task_tile.dart';
import 'package:dgmx_app/data/models/task_model.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class HomePage extends GetView<HomeController> {
  HomePage({super.key}) {
    _controller = Get.put(HomeController());
  }

  static String route = '/home';
  late final HomeController _controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(GlobalVars.appName),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                if(_controller.getTasks(false).isNotEmpty) ...[
                  const Center(
                    child: Text(
                      'Toca una tarea pendiente para completarla',
                      style: TextStyle(
                        fontWeight: FontWeight.w700
                      ))),
                  const SizedBox(height: 20),
                ],
                tasksListView(false),
                const Divider(height: 10, thickness: 3,),
                tasksListView(true),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _controller.addNewTaskForm,
          child: const Icon(Icons.add)),
      ),
    );
  }

  Widget tasksListView(bool status) {
    List<TaskModel> tasks = _controller.getTasks(status);

    if(tasks.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: 60,
        child: Center(child: Text(status
          ? "No existen tareas completadas"
          : "No existen tareas pendientes")),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ...List<Widget>.generate(
          tasks.length,
          (int i) => TaskTile(
            onChange:() {
              _controller.changeTaskStatus(tasks[i].id);
            },
            onDelete: () {
              _controller.removeTask(tasks[i].id);
            },
            task: tasks[i]))
      ],
    );
  }
}