import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'task_model.g.dart';

@HiveType(typeId: 1)
class Task extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  TimeOfDay createdAt;

  @HiveField(3)
  bool isComplated;

  Task({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.isComplated,
  });

  factory Task.create({
    required String name,
    required TimeOfDay createdAt,
  }) {
    return Task(
      id: const Uuid().v1(),
      name: name,
      createdAt: createdAt,
      isComplated: false,
    );
  }
}

// TimeOfDay için özel bir adaptör
class TimeOfDayAdapter extends TypeAdapter<TimeOfDay> {
  @override
  final int typeId = 100; // Benzersiz bir tür kimliği belirtin

  @override
  TimeOfDay read(BinaryReader reader) {
    final hour = reader.readByte();
    final minute = reader.readByte();
    return TimeOfDay(hour: hour, minute: minute);
  }

  @override
  void write(BinaryWriter writer, TimeOfDay obj) {
    writer.writeByte(obj.hour);
    writer.writeByte(obj.minute);
  }
}
