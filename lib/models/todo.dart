import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Todo extends Equatable {
  final bool complete;
  final String id;
  final String note;

  Todo({this.complete = false, String id, String note})
      : this.note = note ?? '',
        this.id = id ?? Uuid().v4();

  Todo copyWith({bool complete, String id, String note}) {
    return Todo(
      complete: complete ?? this.complete,
      id: id ?? this.id,
      note: note ?? this.note,
    );
  }

  @override
  List<Object> get props => [complete, id, note];
}

List<Todo> datas = [
  Todo(complete: false, note: "Học"),
  Todo(complete: false, note: "Chơi"),
  Todo(complete: true, note: "Nghe nhạc"),
  Todo(complete: false, note: "Dọn dẹp"),
  Todo(complete: true, note: "Tập thể dục"),
  Todo(complete: false, note: "Học anh văn"),
  Todo(complete: true, note: "Luyện nghe"),
  Todo(complete: true, note: "Xem phim"),
];
