// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taskdatabace.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskModelAdapter extends TypeAdapter<TaskModel> {
  @override
  final int typeId = 0;

  @override
  TaskModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskModel(
      details: fields[2] as String,
      heading: fields[1] as String,
      startDates: fields[5] as String?,
      endDates: fields[4] as String?,
      subtasks: (fields[3] as List).cast<Subtask>(),
      dailyTaskcompleate: fields[7] as bool,
      taskId: fields[0] as int?,
    )..completedSubtasks = (fields[6] as List).cast<bool>();
  }

  @override
  void write(BinaryWriter writer, TaskModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.taskId)
      ..writeByte(1)
      ..write(obj.heading)
      ..writeByte(2)
      ..write(obj.details)
      ..writeByte(3)
      ..write(obj.subtasks)
      ..writeByte(4)
      ..write(obj.endDates)
      ..writeByte(5)
      ..write(obj.startDates)
      ..writeByte(6)
      ..write(obj.completedSubtasks)
      ..writeByte(7)
      ..write(obj.dailyTaskcompleate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SubtaskAdapter extends TypeAdapter<Subtask> {
  @override
  final int typeId = 2;

  @override
  Subtask read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Subtask(
      description: fields[0] as String,
      isCompleted: fields[1] as bool,
      taskId: fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Subtask obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.description)
      ..writeByte(1)
      ..write(obj.isCompleted)
      ..writeByte(2)
      ..write(obj.taskId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubtaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
