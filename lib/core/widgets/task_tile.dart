import 'package:dgmx_app/data/models/task_model.dart';
import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    required this.task,
    required this.onDelete,
    required this.onChange,
    super.key});

  final TaskModel task;
  final Function() onChange;
  final Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onChange,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        margin: const EdgeInsets.only(bottom: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: task.status ? Colors.green.withOpacity(0.5) : Colors.orange.withOpacity(0.5)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(task.title),
                Text(task.description)
              ],
            )),
            Row(
              children: <Widget>[
                IconButton(
                  onPressed: onDelete,
                  icon: const Icon(Icons.delete))
              ],
            )
          ],
        ),
      ),
    );
  }
}