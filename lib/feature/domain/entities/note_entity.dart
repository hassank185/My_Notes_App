

 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class NoteEntity extends Equatable{
  final String? noteId;
  final String? note;
  final Timestamp? time;
  final String? uid;

  NoteEntity({this.time, this.noteId, this.note, this.uid});

  @override
  // TODO: implement props
  List<Object?> get props => [note,time,uid,noteId];
} 