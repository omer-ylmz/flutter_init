import 'package:flutter/material.dart';
import 'package:proje_4/data/local_storage.dart';
import 'package:proje_4/main.dart';
import 'package:proje_4/models/task_model.dart';

class TaskItem extends StatefulWidget {
  final Task task;
  const TaskItem({super.key, required this.task});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  final TextEditingController _taskNameController = TextEditingController();
  late LocalStorage _localStorage;

  @override
  void initState() {
    super.initState();

    _localStorage = locator<LocalStorage>();
  }

  @override
  Widget build(BuildContext context) {
    _taskNameController.text = widget.task.name;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
            )
          ]),
      child: ListTile(
        leading: GestureDetector(
          onTap: () {
            widget.task.isComplated = !widget.task.isComplated;
            _localStorage.updateTask(task: widget.task);
            setState(() {});
          },
          child: Container(
            decoration: BoxDecoration(
              color: widget.task.isComplated ? Colors.green : Colors.white,
              border: Border.all(color: Colors.grey, width: 0.8),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check,
              color: Colors.white,
            ),
          ),
        ),
        title: widget.task.isComplated
            ? Text(
                widget.task.name,
                style: const TextStyle(
                    decoration: TextDecoration.lineThrough, color: Colors.grey),
              )
            : TextField(
                controller: _taskNameController,
                decoration: const InputDecoration(border: InputBorder.none),
                minLines: 1,
                maxLines: null,
                textInputAction: TextInputAction.done,
                onSubmitted: (value) {
                  if (value.length >= 3) {
                    setState(() {
                      widget.task.name = value;
                      _localStorage.updateTask(task: widget.task);
                    });
                  }
                },
              ),
        trailing: Text(widget.task.createdAt.format(context)),
      ),
    );
  }
}
